//
//  UserMAnagerProtocol.swift
//  Pain
//
//  Created by Leandro Ramos on 6/23/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

protocol UserManagerProtocol {
    
    func getUsername() -> String
    func setUsername(username: String)
    
    func getUserEmail() -> String
    func setUserEmail(email: String)
    
    func getUserChoosesPhoto() -> Bool
    func setUserChoosesPhoto(imageWasChoosen: Bool)
    
}
