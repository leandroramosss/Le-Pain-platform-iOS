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
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.black
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
}

extension RecoveryPasswordViewController: PresenterToRecoveryPasswordProtocol {
    
}

extension RecoveryPasswordViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
        textFieldDelegation()
    }
    
    func viewHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(sendButton)
    }
    
    func setupConstranits() {
        
        emailTextField.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.equalToSuperview().inset(16)
            maker.height.equalTo(40)
        }
        
        sendButton.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(emailTextField.snp.bottom).offset(20)
            maker.height.equalTo(40)
            maker.width.equalTo(100)
        }
    }
    
    @objc func sendButtonPressed() {
        presenter?.recoveryPassword(user: emailTextField.text!)
    }
    
    func textFieldDelegation() {
        emailTextField.delegate = self
    }
    
}

extension RecoveryPasswordViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
}
