//
//  LoginInteractor.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class LoginInteractor: PresenterToLoginInteractorProtocol {
    
    var presenter: InteractorToLoginPresenterProtocol?
    let manager = UserManager()
    
    func getUserEmail() -> String {
        manager.getUserEmail()
    }
    
    func setUserEmail(email: String) {
        manager.setUserEmail(email: email)
    }
    
    func getUserUUID() -> String {
        return manager.getUserUUID()
    }
    
    func setUserUUID(userUUID: String) {
        manager.setUserUUID(userUUID: userUUID)
    }

}
