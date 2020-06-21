//
//  SendEmailPresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/18/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class SendEmailPresenter: ViewToSendEmailPresenterProtocol {
    
    var view: PresenterToSendEmailProtocol?
    var interactor: PresenterToSendEmailInteractorProtocol?
    var router: PresenterToSendEmailRouterProtocol?
    
}

extension SendEmailPresenter: InteractorToSendEmailPresenterProtocol {
    
}
