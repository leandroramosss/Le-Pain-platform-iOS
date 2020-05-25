//
//  SignUpRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class SignUpRouter: PresenterToSignUpRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        let presenter: ViewToSignUpPresenterProtocol & InteractorToSignUpPresenterProtocol = SignUpPresenter()
        let interactor: PresenterToSignUpInteractorProtocol = SignUpInteractor()
        let router: PresenterToSignUpRouterProtocol = SignUpRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "SignUp", bundle: Bundle.main)
    }
}
