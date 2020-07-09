//
//  ProfileInteractor.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class ProfileInteractor: PresenterToProfileInteractorProtocol {
    
    var presenter: InteractorToProfilePresenterProtocol?
    var manager = UserManager()
    
    func getUserChoosesPhoto() -> Bool {
        return manager.getUserChoosesPhoto()
    }
    
    func setUserChoosesPhoto(imageWasChoosen: Bool) {
        manager.setUserChoosesPhoto(imageWasChoosen: imageWasChoosen)
    }

    
}
