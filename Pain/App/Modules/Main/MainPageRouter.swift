//
//  MainPageRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class MainPageRouter: PresenterToMainPageRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController
        let presenter: ViewToMainPagePresenterProtocol & InteractorToMainPagePresenterProtocol = MainPagePresenter()
        let interactor: PresenterToMainPageInteractorProtocol = MainPageInteractor()
        let router: PresenterToMainPageRouterProtocol = MainPageRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "MainPage", bundle: Bundle.main)
    }
}
