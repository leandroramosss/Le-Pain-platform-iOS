//
//  SendEmailViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/18/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit
import Lottie

class SendEmailViewController: UIViewController {
    
    var presenter: ViewToSendEmailPresenterProtocol?
    var alertTitle = String()
    var alertBody = String()
    
    lazy var alertAnimation: AnimationView = {
        let view = AnimationView()
        view.animation = Animation.named("sendEmail")
        return view
    }()
    
    lazy var alertContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var alertTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = label.font.withSize(24)
        label.text = "Le Pain"
        label.textAlignment = .center
        return label
    }()
    
    lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy var alertText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "A email with the link to reset your password, was sent to yor email "
        return label
    }()
    
    lazy var homeButton: AnimatedButton = {
        let button = AnimatedButton()
        button.addTarget(self, action: #selector(didTapHomeButton), for: .touchUpInside)
        button.animation = Animation.named("homeButton")
        button.setPlayRange(fromProgress: 1.5, toProgress: 1, event: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpLayout()
    }
    
    
}

extension SendEmailViewController: PresenterToSendEmailProtocol {
    
}

extension SendEmailViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
        startAnimation()
    }
    
    func viewHierarchy() {
        view.addSubview(alertAnimation)
        view.addSubview(alertContainer)
        view.addSubview(alertTitleLabel)
        view.addSubview(lineLabel)
        view.addSubview(alertText)
        view.addSubview(homeButton)
    }
    
    func setupConstranits() {
        
        alertAnimation.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            maker.height.equalTo(200)
        }
        
        alertContainer.snp.makeConstraints { (maker) in
            maker.top.equalTo(alertAnimation.snp.bottom).offset(5)
            maker.centerX.equalToSuperview()
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.height.equalTo(200)
        }
        
        alertTitleLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(alertContainer.snp.top).offset(10)
            maker.width.equalTo(alertContainer.snp.width).inset(10)
            maker.height.equalTo(25)
        }
        
        lineLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(alertTitleLabel.snp.bottom).offset(10)
            maker.width.equalTo(alertContainer)
            maker.height.equalTo(1)
        }
        
        alertText.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(alertContainer.snp.width).inset(30)
            maker.top.equalTo(lineLabel.snp.bottom).offset(50)
        }
        
        homeButton.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.width.height.equalTo(100)
            maker.top.equalTo(alertContainer.snp.bottom).offset(20)
        }
        
    }
    
    func startAnimation() {
        alertAnimation.loopMode = .loop
        alertAnimation.play()
        alertAnimation.contentMode = .scaleAspectFit
        alertAnimation.animationSpeed = 1.0
    }
    
    @objc func didTapHomeButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.dismiss(animated: true, completion: nil)
            let navigationController = LoginRouter.createModule()
            self.navigationController?.pushViewController(navigationController, animated: true)
        }
    }
}
