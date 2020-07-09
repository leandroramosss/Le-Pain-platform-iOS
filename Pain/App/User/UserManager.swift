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
    
    func getUserEmail() -> String {
        guard let data = UserDefaults.standard.string(forKey: Constants.USEREMAIL) else {
        return ""
        }
        return data
    }
    
    func setUserEmail(email: String) {
        UserDefaults.standard.set(email, forKey: Constants.USEREMAIL)
    }
    
    func getUserChoosesPhoto() -> Bool {
        return UserDefaults.standard.bool(forKey: Constants.PROFILE_PICTURE)
    }
    
    func setUserChoosesPhoto(imageWasChoosen: Bool) {
        UserDefaults.standard.set(imageWasChoosen, forKey: Constants.PROFILE_PICTURE)
    }
    
    func getUserUUID() -> String {
        return UserDefaults.standard.string(forKey: Constants.UUID) ?? ""
    }
    
    func setUserUUID(userUUID: String) {
        UserDefaults.standard.set(userUUID, forKey: Constants.UUID)
    }
    
    func setRemoveUUID(userUUID: String) {
        UserDefaults.standard.removeObject(forKey: Constants.UUID)
    }
    
}
