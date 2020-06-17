//
//  RecoveryPasswordRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/16/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class RecoveryPasswordRouter: PresenterToRecoveryPasswordRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "RecoveryPasswordViewController") as? RecoveryPasswordViewController
        let presenter: ViewToRecoveryPasswordPresenterProtocol & InteractorToRecoveryPasswordPresenterProtocol = RecoveryPasswordPresenter()
        let interactor: PresenterToRecoveryPasswordInteractorProtocol = RecoveryPasswordInteractor()
        let router: PresenterToRecoveryPasswordRouterProtocol = RecoveryPasswordRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "recoveryPassword", bundle: Bundle.main)
    }
    
}
