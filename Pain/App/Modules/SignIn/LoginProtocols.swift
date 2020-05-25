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
    
}

protocol InteractorToLoginPresenterProtocol: class {
    
}

protocol PresenterToLoginInteractorProtocol: class {
    var presenter: InteractorToLoginPresenterProtocol? { get set }
}

protocol PresenterToLoginRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToLoginPresenterProtocol: class {
    var view: PresenterToLoginProtocol? { get set }
    var interactor: PresenterToLoginInteractorProtocol? { get set }
    var router: PresenterToLoginRouterProtocol? { get set }
}
