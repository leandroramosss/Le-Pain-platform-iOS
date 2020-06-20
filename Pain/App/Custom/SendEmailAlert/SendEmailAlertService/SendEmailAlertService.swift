//
//  SendEmailAlertService.swift
//  Pain
//
//  Created by Leandro Ramos on 6/19/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class SendEmailAlertService {
    
    func alert(title: String, body: String) -> SendEmailViewController {
        let storyboard = UIStoryboard(name: "SendEmailAlert", bundle: .main)
        let sendEmailAnimation = storyboard.instantiateViewController(withIdentifier: "SendEmailViewController") as! SendEmailViewController
        sendEmailAnimation.alertTitle = title
        sendEmailAnimation.alertBody = body
        return sendEmailAnimation
    }
}
