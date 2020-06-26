//
//  SignUpPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class SignUpPresenter: ViewToSignUpPresenterProtocol {
    var view: PresenterToSignUpProtocol?
    var interactor: PresenterToSignUpInteractorProtocol?
    var router: PresenterToSignUpRouterProtocol?
    
    let networking = Networking()
    
    func createUser(email: String, passWord: String) {
        Auth.auth().createUser(withEmail: email, password: passWord) { result, error in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.invalidEmail.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Invalid email", preferredStyle: .alert)
                self.view?.endRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.weakPassword.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Weak password, password should have more than 6 digits", preferredStyle: .alert)
                self.view?.endRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.credentialAlreadyInUse.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Invalid credencials", preferredStyle: .alert)
                self.view?.endRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.emailAlreadyInUse.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "email also in use", preferredStyle: .alert)
                self.view?.endRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.networkError.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "verify internet connection", preferredStyle: .alert)
                self.view?.endRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.missingEmail.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "missing email", preferredStyle: .alert)
//                self.view?.endRequestWithError(alert: alert)
                self.view?.showAlert(alert: alert, valid: true)
            default:
                if let user = result?.user {
                    print(user.uid)
                }
                self.view?.endRequestSuccessfully()
            }
        }
    }
}

extension SignUpPresenter: InteractorToSignUpPresenterProtocol {
    
}
