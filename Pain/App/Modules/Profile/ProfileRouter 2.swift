//
//  ProfileRouter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter: PresenterToProfileRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        let presenter: ViewToProfilePresenterProtocol & InteractorToProfilePresenterProtocol = ProfilePresenter()
        let interactor: PresenterToProfileInteractorProtocol = ProfileInteractor()
        let router: PresenterToProfileRouterProtocol = ProfileRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view!
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "ProfileStoryboard", bundle: Bundle.main)
    }
    
}
