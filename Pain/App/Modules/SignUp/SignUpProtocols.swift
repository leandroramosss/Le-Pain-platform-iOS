//
//  SignUpProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToSignUpProtocol: class {
    func endRequestWithError(alert: UIAlertController)
    func showAlert(alert: UIAlertController, valid: Bool)

}

protocol InteractorToSignUpPresenterProtocol: class {
    
}

protocol PresenterToSignUpInteractorProtocol: class {
    var presenter: InteractorToSignUpPresenterProtocol? { get set }
}

protocol PresenterToSignUpRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToSignUpPresenterProtocol: class {
    var view: PresenterToSignUpProtocol? { get set }
    var interactor: PresenterToSignUpInteractorProtocol? { get set }
    var router: PresenterToSignUpRouterProtocol? { get set }
    
    func createUser(email: String, passWord: String)
}
