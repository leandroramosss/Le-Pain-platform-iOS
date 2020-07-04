//
//  ProfileProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToProfileProtocol: class {
    
}

protocol InteractorToProfilePresenterProtocol: class {
    
}

protocol PresenterToProfileInteractorProtocol: class {
    var presenter: InteractorToProfilePresenterProtocol? { get set }
    
}

protocol PresenterToProfileRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToProfilePresenterProtocol: class {
    var view: PresenterToProfileProtocol? { get set }
    var interactor: PresenterToProfileInteractorProtocol? { get set }
    var router: PresenterToProfileRouterProtocol? { get set }
}
