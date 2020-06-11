//
//  LoginPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class LoginPresenter: ViewToLoginPresenterProtocol {
    
    var view: PresenterToLoginProtocol?
    var interactor: PresenterToLoginInteractorProtocol?
    var router: PresenterToLoginRouterProtocol?
    
    let networking = Networking()
    
    func signInUser(user email: String, user password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.wrongPassword.rawValue:
                let alert = UIAlertController(title: "Warining", message: "wrongPassword", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
                print("wrong password")
            case .some(let error as NSError) where error.code == AuthErrorCode.invalidEmail.rawValue:
                let alert = UIAlertController(title: "Warining", message: "Invalid Email", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
                print("invalid email")
            case .some(let error):
                let alert = UIAlertController(title: "Warining", message: "Internal error: Try again later", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
                print("Login error: \(error.localizedDescription)")
            case .none:
                if let user = result?.user {
                    print(user.uid)
                }
                self.view?.didEndRequestSuccesfully()
            }
        }
    }
}

extension LoginPresenter: InteractorToLoginPresenterProtocol {
    
}
