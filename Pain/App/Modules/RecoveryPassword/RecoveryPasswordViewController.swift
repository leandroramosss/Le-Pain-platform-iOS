//
//  RecoveryPasswordViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/16/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class RecoveryPasswordViewController: UIViewController {
    
    var presenter: ViewToRecoveryPasswordPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
}

extension RecoveryPasswordViewController: PresenterToRecoveryPasswordProtocol {
    
}

extension RecoveryPasswordViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        
    }
    
    func setupConstranits() {
        
    }
    
}
