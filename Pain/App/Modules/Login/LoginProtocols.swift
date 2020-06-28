//
//  LoginProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToLoginProtocol: class {
    func didEndRequestWithError(alert: AnimatedAlertViewController)
    func showAlert(alert: UIAlertController, valid: Bool)
    func didEndRequestSuccesfully() 
}

protocol InteractorToLoginPresenterProtocol: class {
    
}

protocol PresenterToLoginInteractorProtocol: class {
    var presenter: InteractorToLoginPresenterProtocol? { get set }
    
    func getUserEmail() -> String
    func setUserEmail(email: String)

}

protocol PresenterToLoginRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToLoginPresenterProtocol: class {
    var view: PresenterToLoginProtocol? { get set }
    var interactor: PresenterToLoginInteractorProtocol? { get set }
    var router: PresenterToLoginRouterProtocol? { get set }
    
    func signInUser(user email: String, user password: String)
    
    func getUserEmail() -> String
    func setUserEmail(email: String)

}
