//
//  MainPageViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit
import Lottie

class MainPageViewController: UIViewController {
    
    lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var profileView: AnimationView = {
        let profile = AnimationView()
        profile.backgroundColor = .white
        profile.layer.cornerRadius = 40
        profile.clipsToBounds = true
        profile.layer.masksToBounds = true
        profile.layer.borderWidth = 1
        profile.layer.borderColor = UIColor.black.cgColor
        return profile
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    var presenter: ViewToMainPagePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
}

extension MainPageViewController: PresenterToMainPageProtocol {
    
}

extension MainPageViewController: ViewLayoutProtocol {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        view.addSubview(navigationView)
        navigationView.addSubview(profileView)
        navigationView.addSubview(usernameLabel)
        navigationView.addSubview(emailLabel)
    }
    
    func setupConstranits() {
        navigationView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            maker.width.equalToSuperview()
            maker.height.equalTo(92)
        }
        
        profileView.snp.makeConstraints { (maker) in
            maker.height.bottom.equalTo(navigationView).inset(6)
            maker.width.equalTo(80)
            maker.leading.equalTo(navigationView.snp.leading).offset(10)
        }
        
        usernameLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(navigationView.snp.top).offset(20)
            maker.height.equalTo(20)
            maker.width.equalTo(250)
            maker.leading.equalTo(profileView.snp.trailing).offset(10)
        }
        
        emailLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(usernameLabel.snp.bottom).offset(20)
            maker.leading.equalTo(profileView.snp.trailing).offset(10)
            maker.width.equalTo(250)
            maker.height.equalTo(20)
        }
    }
}
