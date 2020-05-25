//
//  LoginPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class LoginPresenter: ViewToLoginPresenterProtocol {
    
    var view: PresenterToLoginProtocol?
    var interactor: PresenterToLoginInteractorProtocol?
    var router: PresenterToLoginRouterProtocol?
    
    let networking = Networking()
    
    func signInUser(user email: String, user password: String) {
        networking.signInUser(with: email, with: password)
    }
}

extension LoginPresenter: InteractorToLoginPresenterProtocol {
    
}
