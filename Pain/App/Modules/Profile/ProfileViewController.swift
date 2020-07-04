//
//  ProfileViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var presenter: ViewToProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.5, animations: { [weak self] in
            self?.view.transform = CGAffineTransform.identity
        })
    }
}

extension ProfileViewController: PresenterToProfileProtocol {
    
}
