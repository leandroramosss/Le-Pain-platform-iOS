//
//  AnimateAlertPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class AnimatedAlertPresenter: ViewToAnimatedAlertPresenterProtocol {
    
    var view: PresenterToAnimatedAlertProtocol?
    var interactor: PresenterToAnimatedAlertInteractorProtocol?
    var router: PresenterToAnimatedAlertRouterProtocol?
}

extension AnimatedAlertPresenter: InteractorToAnimatedAlertPresenterProtocol {
    
}
