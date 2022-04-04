//
//  AuthManager.swift
//  Spotify
//
//  Created by Aurelio Le Clarke on 23.03.2022.
//

import Foundation


final class AuthManager {
    
    struct Constants {
        static let ClientID = "7e714b73531f4c56af812204f996b569"
        static let ClientSecret = "3d33da2e1b5845b28b8130e30b514c65"
        static let tokenAPIUrl = "https://accounts.spotify.com/api/token"
    }
    
    static let shared = AuthManager()
    public var signURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.linkedin.com/in/abylay-baibol-3935aa226/"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.ClientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    private init() {}
    
    var isSigned: Bool {
        return false
    }
    private var accessToken: String? {
        return nil
    }
    private var refreshToken: String? {
        return nil
    }
    private var tokenExpirationDate: Date? {
        return nil
    }

    private var shouldRefreshToken: Bool {
        return false
    }

    
    public func ExchangeForToken(code: String,completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: Constants.tokenAPIUrl) else { return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: "https://www.linkedin.com/in/abylay-baibol-3935aa226/")
      
            
        ]
        request.httpBody = components.query?.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let basicToken = Constants.ClientID+":"+Constants.ClientSecret
        let data  = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else { completion( false)
            print("failure to get base64")
            return
            
        }
       
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data,
                  error == nil else
           {
                completion(false)
                return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCCESS: \(json)")
            completion(true)
        }catch {
            print(error.localizedDescription)
            completion(false)
        }
        }
        task.resume()
    
    }
    public func  refreshAccessToken() {
        
        
    }
    private func cacheToken() {
        
    }

}
