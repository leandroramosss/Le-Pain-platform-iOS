//
//  MainPagePresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation

class MainPagePresenter: ViewToMainPagePresenterProtocol {
    var view: PresenterToMainPageProtocol?
    var interactor: PresenterToMainPageInteractorProtocol?
    var router: PresenterToMainPageRouterProtocol?
}

extension MainPagePresenter: InteractorToMainPagePresenterProtocol {
    
}
