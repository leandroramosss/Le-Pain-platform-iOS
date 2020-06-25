//
//  UserManager.swift
//  Pain
//
//  Created by Leandro Ramos on 6/21/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class UserManager: UserManagerProtocol {
    
    func getUsername() -> String {
        guard let data = UserDefaults.standard.string(forKey: Constants.USERNAME) else {
            return ""
        }
        return data
    }
    
    func setUsername(username: String) {
        UserDefaults.standard.set(username, forKey: Constants.USERNAME)
    }
        
}
