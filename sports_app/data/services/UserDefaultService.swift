//
//  UserDefaultService.swift
//  sports_app
//
//  Created by Abdullh Gaber on 23/05/2026.
//

import Foundation

class UserDefaultService: UserDefaultServiceProtocol {
    
    private let userDefaults: UserDefaults
    private let firstEntryKey = "isFirstEntry"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func saveFirstEntry(_ isFirstEntry: Bool) {
        userDefaults.set(isFirstEntry, forKey: firstEntryKey)
    }
    
    func readFirstEntry() -> Bool {
        if userDefaults.object(forKey: firstEntryKey) == nil {
            return true
        }
        return userDefaults.bool(forKey: firstEntryKey)
    }
}
