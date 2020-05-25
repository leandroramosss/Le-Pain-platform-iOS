//
//  SignUpViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    var presenter: ViewToSignUpPresenterProtocol?
    
    lazy var navigationBarExtentionView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var emailTextfield: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
}

extension SignUpViewController: PresenterToSignUpProtocol {
    
}

extension SignUpViewController: ViewLayoutProtocol, UITextFieldDelegate {
    func setUpLayout() {
        setUpNavigation()
        viewHierarchy()
        setupConstranits()
        handleTextFields()
    }
    
    func viewHierarchy() {
        view.addSubview(navigationBarExtentionView)
        navigationBarExtentionView.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(continueButton)
    }
    
    func setupConstranits() {
        navigationBarExtentionView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide)
            maker.width.equalToSuperview()
            maker.height.equalTo(100)
        }
        
        emailTextfield.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(emailTextfield.snp.bottom).offset(20)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        continueButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
    }
    
    func setUpNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Subscribe!!"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .red
    }
    
    func handleTextFields() {
        emailTextfield.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @objc func continueButtonTapped() {
        if emailTextfield.text?.isEmpty == true {
            emailTextfield.layer.borderColor = UIColor.red.cgColor
            print("email empty")
        } else if passwordTextField.text?.isEmpty == true {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            presenter?.createUser(email: emailTextfield.text ?? "", passWord: passwordTextField.text ?? "")
            let viewController = LoginRouter.createModule()
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true, completion: nil)
        }
    }
}
