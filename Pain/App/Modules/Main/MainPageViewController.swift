//
//  MainPageViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var presenter: ViewToMainPagePresenterProtocol?
    var manager = UserManager()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()

    }
    
}

extension MainPageViewController: PresenterToMainPageProtocol {
    
}

extension MainPageViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
        setUpWelcomeLabel()
    }
    
    func viewHierarchy() {
        view.addSubview(welcomeLabel)
    }
    
    func setupConstranits() {
        
        welcomeLabel.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview().inset(16)
            maker.height.equalTo(30)
        }
    }
    
    func setUpWelcomeLabel() {
        let username = manager.getUsername()
        welcomeLabel.text = "Welcome, \(username)"
    }
}
