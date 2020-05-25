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
}

extension SignUpPresenter: InteractorToSignUpPresenterProtocol {
    
}
