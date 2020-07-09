//
//  ProfilePresenter.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class ProfilePresenter: ViewToProfilePresenterProtocol {
    
    var view: PresenterToProfileProtocol?
    var interactor: PresenterToProfileInteractorProtocol?
    var router: PresenterToProfileRouterProtocol?
    var manager = UserManager()
    
    func getUserChoosesPhoto() -> Bool {
        return ((interactor?.getUserChoosesPhoto()) != nil)
    }
    
    func setUserChoosesPhoto(imageWasChoosen: Bool) {
        interactor?.setUserChoosesPhoto(imageWasChoosen: imageWasChoosen)
    }
    
    func setRemoveUUID(userUUID: String) {
        interactor?.setRemoveUUID(userUUID: userUUID)
    }

}

extension ProfilePresenter: InteractorToProfilePresenterProtocol {
    
    func signOutUser() {
        
        do {
            try Auth.auth().signOut()
            let userUUID = manager.getUserUUID()
            self.interactor?.setRemoveUUID(userUUID: userUUID)
            UserDefaults.standard.synchronize()
            self.view?.didEndRequestSuccesfully()
        } catch let error {
            print("Error trying to sign out of Firebase: \(error.localizedDescription)")
        }
    }

}
