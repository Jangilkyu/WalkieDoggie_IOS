//
//  LS.swift
//  WalkieDoggie
//
//  Created by jangilkyu on 2022/08/18.
//

import Foundation

class LS {
 
    // MARK: - Set
    static func setAccessToken(_ accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: "Accesstoken")
        sync()
    }
    
    static func setRefreshToken(_ refreshToken: String) {
        UserDefaults.standard.set(refreshToken, forKey: "RefreshToken")
        sync()

    }
    
    // MARK: - Get
    static func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: "Accesstoken")
    }
    
    static func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: "RefreshToken")
    }
    
    // MARK: - Revmoe
    static func removeAccessToken() {
        UserDefaults.standard.removeObject(forKey: "Accesstoken")
        sync()
    }
    
    static func removeRefreshToken() {
        UserDefaults.standard.removeObject(forKey: "RefreshToken")
        sync()
    }
    
    // MARK: - Util
    private static func sync() {
        UserDefaults.standard.synchronize()
    }
}
