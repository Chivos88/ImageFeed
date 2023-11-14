//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Илья Чемоданов on 14.11.2023.
//

import Foundation

class OAuth2TokenStorage {
    private let tokenKey = "OAuth2Token"

    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
}
