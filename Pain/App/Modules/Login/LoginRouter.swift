//
//  LoginRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class LoginRouter: PresenterToLoginRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        let presenter: ViewToLoginPresenterProtocol & InteractorToLoginPresenterProtocol = LoginPresenter()
        let interactor: PresenterToLoginInteractorProtocol = LoginInteractor()
        let router: PresenterToLoginRouterProtocol = LoginRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
