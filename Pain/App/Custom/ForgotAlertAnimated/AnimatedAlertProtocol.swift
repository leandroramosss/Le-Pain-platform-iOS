//
//  AnimatedAlertProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToAnimatedAlertProtocol: class {
    
}

protocol InteractorToAnimatedAlertPresenterProtocol: class {
    
}

protocol PresenterToAnimatedAlertInteractorProtocol: class {
    var presenter: InteractorToAnimatedAlertPresenterProtocol? { get set }
}

protocol PresenterToAnimatedAlertRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToAnimatedAlertPresenterProtocol: class {
    var view: PresenterToAnimatedAlertProtocol? { get set }
    var interactor: PresenterToAnimatedAlertInteractorProtocol? { get set }
    var router: PresenterToAnimatedAlertRouterProtocol? { get set }
}
