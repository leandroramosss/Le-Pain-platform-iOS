//
//  AnimatedForgotCredencialsAlertServices.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class AnimatedForgotCredencialsAlertServices {
    
    func alert(title: String, body: String) -> AnimatedAlertViewController {
        let storyboard = UIStoryboard(name: "ForgotCredencialsAnimatedAlert", bundle: .main)
        let forgotAnimatedAlert = storyboard.instantiateViewController(withIdentifier: "ForgotCredencialsAnimatedAlert") as! AnimatedAlertViewController
        forgotAnimatedAlert.alertTitle = title
        forgotAnimatedAlert.alertMessage = body
        return forgotAnimatedAlert
    }
}
