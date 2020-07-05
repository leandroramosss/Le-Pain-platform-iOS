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
    var forgotAnimatedAlert = AnimatedForgotCredencialsAlertServices()
        
    func getUserEmail() -> String {
        (interactor?.getUserEmail())!
    }
    
    func setUserEmail(email: String) {
        interactor?.setUserEmail(email: email)
    }
    
}

extension LoginPresenter: InteractorToLoginPresenterProtocol {
    
    func signInUser(user email: String, user password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.wrongPassword.rawValue:
                let alert = self.forgotAnimatedAlert.alert(title: "Le Pain", body: "Invalid Password\n or invalid email \n was entered, please check again.")
                self.view?.didEndRequestWithError(alert: alert)
                print("wrong password")
            case .some(let error as NSError) where error.code == AuthErrorCode.invalidEmail.rawValue:
                let alert = self.forgotAnimatedAlert.alert(title: "Le Pain", body: "Invalid Password\n or invalid email \n was entered, please check again.")
                self.view?.didEndRequestWithError(alert: alert)
                print("invalid email")
            case .some(let error as NSError) where error.code == AuthErrorCode.networkError.rawValue:
                let alert = self.forgotAnimatedAlert.alert(title: "Warning", body: "Connection lost, there was some error network error.\nPlease veryfy the connection")
                self.view?.didEndRequestWithError(alert: alert)
            case .some(let error):
                let alert = self.forgotAnimatedAlert.alert(title: "Sorry", body: "Internal error.\n Due to some updating we are facing problems\n try againLater")
                self.view?.didEndRequestWithError(alert: alert)
                print("Login error: \(error.localizedDescription)")
            default:
                if let user = result?.user {
                    print(user.uid)
                }
                self.view?.didEndRequestSuccesfully()
            }
        }
    }
}
