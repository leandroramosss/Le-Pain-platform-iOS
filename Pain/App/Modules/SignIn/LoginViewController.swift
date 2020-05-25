//
//  LoginViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SnapKit

class LoginViewController: UIViewController {
    
    var presenter: ViewToLoginPresenterProtocol?
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Le Pain"
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signUpBottomPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpLayout()
        handleTextFields()
        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpNavigation()
    }
}

extension LoginViewController: PresenterToLoginProtocol {
    
}

extension LoginViewController: ViewLayoutProtocol, UITextFieldDelegate {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }
    
    func setupConstranits() {
        imageView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            maker.width.equalToSuperview().inset(25)
            maker.height.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView.snp.bottom).offset(10)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(60)
        }
        
        emailTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom)
            maker.width.equalToSuperview().inset(16)
            maker.height.equalTo(40)
            maker.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(emailTextField.snp.bottom).offset(20)
            maker.width.equalToSuperview().inset(16)
            maker.height.equalTo(40)
            maker.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(40)
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setUpNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func handleTextFields() {
        passwordTextField.delegate = self
        emailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @objc func signUpBottomPressed() {
        let viewController = SignUpRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
