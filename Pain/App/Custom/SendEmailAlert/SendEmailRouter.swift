//
//  SendEmailRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/18/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class SendEmailRouter: PresenterToSendEmailRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SendEmailViewController") as? SendEmailViewController
        let presenter: ViewToSendEmailPresenterProtocol & InteractorToSendEmailPresenterProtocol = SendEmailPresenter()
        let interactor: PresenterToSendEmailInteractorProtocol = SendEmailInteractor()
        let router: PresenterToSendEmailRouterProtocol = SendEmailRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "SendEmailAlert", bundle: Bundle.main)
    }
    
}
