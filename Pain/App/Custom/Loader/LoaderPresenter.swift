//
//  LoaderPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class LoaderPresenter: ViewToLoaderPresenterProtocol {
    var view: PresenterToLoaderProtocol?
    var interactor: PresenterToLoaderInteractorProtocol?
    var router: PresenterToLoaderRouterProtocol?
    
}

extension LoaderPresenter: InteractorToLoaderPresenterProtocol {
    
}
