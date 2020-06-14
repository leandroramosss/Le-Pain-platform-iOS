//
//  LoaderRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class LoaderRouter: PresenterToLoaderRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "LoaderViewController") as? LoaderViewController
        let presenter: ViewToLoaderPresenterProtocol & InteractorToLoaderPresenterProtocol = LoaderPresenter()
        let interactor: PresenterToLoaderInteractorProtocol = LoaderInteractor()
        let router: PresenterToLoaderRouterProtocol = LoaderRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Loader", bundle: Bundle.main)
    }
    
}
