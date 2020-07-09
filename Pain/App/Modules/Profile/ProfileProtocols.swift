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
    func didEndRequestSuccesfully()
}

protocol InteractorToProfilePresenterProtocol: class {
    
}

protocol PresenterToProfileInteractorProtocol: class {
    var presenter: InteractorToProfilePresenterProtocol? { get set }
    
    func getUserChoosesPhoto() -> Bool
    func setUserChoosesPhoto(imageWasChoosen: Bool)

    
}

protocol PresenterToProfileRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ViewToProfilePresenterProtocol: class {
    var view: PresenterToProfileProtocol? { get set }
    var interactor: PresenterToProfileInteractorProtocol? { get set }
    var router: PresenterToProfileRouterProtocol? { get set }
    
    func getUserChoosesPhoto() -> Bool
    func setUserChoosesPhoto(imageWasChoosen: Bool)
    
    func signOutUser() 
}
