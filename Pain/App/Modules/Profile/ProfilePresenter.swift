//
//  ProfilePresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class ProfilePresenter: ViewToProfilePresenterProtocol {
    var view: PresenterToProfileProtocol?
    var interactor: PresenterToProfileInteractorProtocol?
    var router: PresenterToProfileRouterProtocol?
    
}

extension ProfilePresenter: InteractorToProfilePresenterProtocol {
    
}
