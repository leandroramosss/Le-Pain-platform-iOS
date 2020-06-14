//
//  LoaderProtocols.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToLoaderProtocol: class {
    
}

protocol InteractorToLoaderPresenterProtocol: class {

}

protocol PresenterToLoaderInteractorProtocol: class {
    var presenter: InteractorToLoaderPresenterProtocol? { get set }
}

protocol PresenterToLoaderRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToLoaderPresenterProtocol: class {
    var view: PresenterToLoaderProtocol? { get set }
    var interactor: PresenterToLoaderInteractorProtocol? { get set }
    var router: PresenterToLoaderRouterProtocol? { get set }
}
