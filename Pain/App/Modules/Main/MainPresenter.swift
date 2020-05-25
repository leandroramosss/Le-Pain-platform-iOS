//
//  MainPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class MainPresenter: ViewToMainPagePresenterProtocol {
    var view: PresenterToMainPageProtocol?
    var interactor: PresenterToMainPageInteractorProtocol?
    var router: PresenterToMainPageRouterProtocol?
}

extension MainPresenter: InteractorToMainPagePresenterProtocol {
    
}
