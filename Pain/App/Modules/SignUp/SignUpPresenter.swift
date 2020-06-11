//
//  SignUpPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class SignUpPresenter: ViewToSignUpPresenterProtocol {
    var view: PresenterToSignUpProtocol?
    var interactor: PresenterToSignUpInteractorProtocol?
    var router: PresenterToSignUpRouterProtocol?
    
    let networking = Networking()
    
    func createUser(email: String, passWord: String) {
//        networking.createUser(email: email, passWord: passWord)
    }
}

extension SignUpPresenter: InteractorToSignUpPresenterProtocol {
    
}
