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
    }
    
    static let shared = AuthManager()
    
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

}
