//
//  UserRepoProtocol.swift
//  sports_app
//
//  Created by Abdullh Gaber on 23/05/2026.
//

import Foundation

protocol UserRepoProtocol {
    func saveFirstEntry(_ isFirstEntry: Bool)
    func readFirstEntry() -> Bool
}
