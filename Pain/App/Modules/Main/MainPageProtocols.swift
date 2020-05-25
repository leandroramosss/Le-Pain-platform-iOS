//
//  MainPageProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToMainPageProtocol: class {
    
}

protocol InteractorToMainPagePresenterProtocol: class {
    
}

protocol PresenterToMainPageInteractorProtocol: class {
    var presenter: InteractorToMainPagePresenterProtocol? { get set }
}

protocol PresenterToMainPageRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToMainPagePresenterProtocol: class {
    var view: PresenterToMainPageProtocol? { get set }
    var interactor: PresenterToMainPageInteractorProtocol? { get set }
    var router: PresenterToMainPageRouterProtocol? { get set }
}
