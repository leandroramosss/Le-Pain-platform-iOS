//
//  RecoverPasswordPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/16/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class RecoveryPasswordPresenter: ViewToRecoveryPasswordPresenterProtocol {
    
    
    var view: PresenterToRecoveryPasswordProtocol?
    var interactor: PresenterToRecoveryPasswordInteractorProtocol?
    var router: PresenterToRecoveryPasswordRouterProtocol?
    let sendEmailAlert = SendEmailAlertService()
    let forgotCredentials = AnimatedForgotCredencialsAlertServices()
    
    func recoveryPassword(user email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            switch error {
            case .some(let error as NSError) where error.code == AuthErrorCode.invalidEmail.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Invalid Email address", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.internalError.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Sorry looks like we have a problem, try again later", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.networkError.rawValue:
                let alert = UIAlertController(title: "Le Pain", message: "Internet error, please check your connection", preferredStyle: .alert)
                self.view?.didEndRequestWithError(alert: alert)
            case .some(let error as NSError) where error.code == AuthErrorCode.missingEmail.rawValue:
                let alert = self.forgotCredentials.alert(title: "Le Pain", body: "Looks like that you forgot your email, or mistyped it, please check it out")
                self.view?.didEndRequestWithCredebtialsErrors(alert: alert)
            default:
                let alert = self.sendEmailAlert.alert(title: "Le Pain", body: "An reset link was sent to your email addres")
                self.view?.didEndRequestSuccessfully(alert: alert)
            }
        }
    }
}

extension RecoveryPasswordPresenter: InteractorToRecoveryPasswordPresenterProtocol {
    
}
