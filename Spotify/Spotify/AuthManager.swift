//
//  AuthManager.swift
//  Spotify
//
//  Created by Aurelio Le Clarke on 23.03.2022.
//

import Foundation


final class AuthManager {
    
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
