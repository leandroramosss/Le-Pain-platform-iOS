//
//  RecoveryPasswordProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 6/16/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToRecoveryPasswordProtocol: class {
    
}

protocol InteractorToRecoveryPasswordPresenterProtocol: class {
    
}

protocol PresenterToRecoveryPasswordInteractorProtocol: class {
    var presenter: InteractorToRecoveryPasswordPresenterProtocol? { get set }
    
}

protocol PresenterToRecoveryPasswordRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToRecoveryPasswordPresenterProtocol: class {
    var view: PresenterToRecoveryPasswordProtocol? { get set }
    var interactor: PresenterToRecoveryPasswordInteractorProtocol? { get set }
    var router: PresenterToRecoveryPasswordRouterProtocol? { get set }
    
    func recoveryPassword(user email: String)
}
