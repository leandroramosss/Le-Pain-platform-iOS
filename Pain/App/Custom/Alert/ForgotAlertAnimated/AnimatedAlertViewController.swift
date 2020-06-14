//
//  AnimateAlertViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class AnimatedAlertViewController: UIViewController {
    
    var presenter: ViewToAnimatedAlertPresenterProtocol?
    var alertTitle = String()
    var alertMessage = String()
    
    lazy var animatedView: AnimationView = {
        let view = AnimationView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var alertConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    lazy var alertTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Le Pain"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = label.font.withSize(24)
        return label
    }()
    
    lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy var alertContent: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Invalid Password\n or invalid email \n was entered, please check again."
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var alertButton: AnimatedButton = {
        let button = AnimatedButton()
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.animation = Animation.named("homeButton")
        button.setPlayRange(fromProgress: 1.5, toProgress: 1, event: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setUpLayout()
        setUpAlert()
    }
    
}

extension AnimatedAlertViewController: PresenterToAnimatedAlertProtocol {
    
}

extension AnimatedAlertViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
        startAnimation()
    }
    
    func viewHierarchy() {
        view.addSubview(animatedView)
        view.addSubview(alertConteiner)
        view.addSubview(alertTitleLabel)
        view.addSubview(lineLabel)
        view.addSubview(alertContent)
        view.addSubview(alertButton)
    }
    
    func setupConstranits() {
        animatedView.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            maker.width.equalToSuperview().inset(60)
            maker.height.equalTo(200)
        }
        
        alertConteiner.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(animatedView.snp.bottom)
            maker.width.equalToSuperview().inset(20)
            maker.height.equalTo(200)
        }
        
        alertTitleLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(alertConteiner.snp.top).offset(10)
            maker.width.equalTo(alertConteiner.snp.width).inset(16)
            maker.height.equalTo(40)
        }
        
        lineLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(1)
            maker.width.equalTo(alertConteiner.snp.width)
            maker.top.equalTo(alertTitleLabel.snp.bottom).offset(5)
        }
        
        alertContent.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(alertTitleLabel.snp.bottom).offset(50)
            maker.width.equalTo(alertConteiner.snp.width).inset(16)
        }
        
        alertButton.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(alertConteiner.snp.bottom).offset(20)
            maker.width.equalTo(100)
            maker.height.equalTo(100)
        }
    }
    
    func startAnimation() {
        animatedView.animation = Animation.named("forgetAnimation")
        animatedView.loopMode = .loop
        animatedView.play()
        animatedView.contentMode = .scaleAspectFit
        animatedView.animationSpeed = 1.5
    }
        
    @objc func backButtonPressed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true)
        }
    }
    
    func setUpAlert() {
        alertTitleLabel.text = alertTitle
        alertContent.text = alertMessage
    }
}
