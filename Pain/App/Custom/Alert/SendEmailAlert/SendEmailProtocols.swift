//
//  SendEmailProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 6/18/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToSendEmailProtocol: class {
    
}

protocol InteractorToSendEmailPresenterProtocol: class {
    
}

protocol PresenterToSendEmailInteractorProtocol: class {
    var presenter: InteractorToSendEmailPresenterProtocol? { get set }
    
}

protocol PresenterToSendEmailRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToSendEmailPresenterProtocol: class {
    var view: PresenterToSendEmailProtocol? { get set }
    var interactor: PresenterToSendEmailInteractorProtocol? { get set }
    var router: PresenterToSendEmailRouterProtocol? { get set }
}
