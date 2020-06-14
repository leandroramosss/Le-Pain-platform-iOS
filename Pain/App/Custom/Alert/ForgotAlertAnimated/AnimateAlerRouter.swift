//
//  AnimateAlerRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class AnimatedAlertRouter: PresenterToAnimatedAlertRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ForgotCredencialsAnimatedAlert") as? AnimatedAlertViewController
        let presenter: ViewToAnimatedAlertPresenterProtocol & InteractorToAnimatedAlertPresenterProtocol = AnimatedAlertPresenter()
        let interactor: PresenterToAnimatedAlertInteractorProtocol = AnimatedAlertInteractor()
        let router: PresenterToAnimatedAlertRouterProtocol = AnimatedAlertRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "ForgotCredencialsAnimatedAlert", bundle: Bundle.main)
    }
}
