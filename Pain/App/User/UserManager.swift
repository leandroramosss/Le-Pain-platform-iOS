//
//  UserManager.swift
//  Pain
//
//  Created by Leandro Ramos on 6/21/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class UserManager {
    
    func getUserName() -> String {
        let userName = UserDefaults.standard.string(forKey: Constants.USERNAME)
        return userName ?? ""
    }
    
    func setUserName(userName: String) {
        UserDefaults.standard.set(userName, forKey: Constants.USERNAME)
    }
    
}
