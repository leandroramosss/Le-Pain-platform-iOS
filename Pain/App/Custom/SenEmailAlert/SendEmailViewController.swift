//
//  SendEmailViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/18/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class SendEmailViewController: UIViewController {
    
    var presenter: ViewToSendEmailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SendEmailViewController: PresenterToSendEmailProtocol {
    
}
