//
//  SignUpInteractor.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class SignUpInteractor: PresenterToSignUpInteractorProtocol {
    
    var presenter: InteractorToSignUpPresenterProtocol?
    var manager = UserManager()
    
    func getUsername() -> String {
        return manager.getUsername()
    }
    
    func setUsername(username: String) {
        manager.setUsername(username: username)
    }

}
