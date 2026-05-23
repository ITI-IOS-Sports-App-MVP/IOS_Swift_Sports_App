//
//  UserRepo.swift
//  sports_app
//
//  Created by Abdullh Gaber on 23/05/2026.
//

import Foundation

class UserRepo: UserRepoProtocol {
    
    private let userDefaultService: UserDefaultServiceProtocol
    
    init(userDefaultService: UserDefaultServiceProtocol) {
        self.userDefaultService = userDefaultService
    }
    
    func saveFirstEntry(_ isFirstEntry: Bool) {
        userDefaultService.saveFirstEntry(isFirstEntry)
    }
    
    func readFirstEntry() -> Bool {
        return userDefaultService.readFirstEntry()
    }
}
