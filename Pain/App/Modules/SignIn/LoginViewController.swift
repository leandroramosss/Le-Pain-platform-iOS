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
import Lottie

class LoginViewController: UIViewController {
    
    var presenter: ViewToLoginPresenterProtocol?
    let animamationView = AnimationView()
    
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var forgetPassword: UIButton = {
        let button = UIButton()
        button.setTitle("forgot password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subscribe", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signUpBottonPressed), for: .touchUpInside)
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
    func didEndRequestWithError(alert: AnimatedAlertViewController) {
        self.present(alert, animated: true)
    }
    
    
    func didEndRequestSuccesfully() {
        let viewController = MainPageRouter.createModule()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    func didEndRequestWithError(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            let viewController = LoginRouter.createModule()
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }))
        present(alert, animated: true)
    }
    
    func showAlert(alert: UIAlertController, valid: Bool) {
        if !valid {
            alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: { (action) in
                let viewController = LoginRouter.createModule()
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            }))
            present(alert, animated: true)
        }
    }
    
    
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
        view.addSubview(forgetPassword)
        view.addSubview(animamationView)
    }
    
    func setupConstranits() {
        imageView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(40)
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
            maker.top.equalTo(passwordTextField.snp.bottom).offset(50)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
        
        forgetPassword.snp.makeConstraints { (maker) in
            maker.top.equalTo(signInButton.snp.bottom).offset(15)
            maker.height.equalTo(40)
            maker.width.equalTo(200)
            maker.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(40)
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func startAnimation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        animamationView.animation = Animation.named("loading")
        animamationView.frame = view.bounds
        animamationView.backgroundColor = .black
        animamationView.contentMode = .scaleAspectFit
        animamationView.loopMode = .loop
        animamationView.play()
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
    
    @objc func signInButtonPressed() {
        startAnimation()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
            self.presenter?.signInUser(user: self.emailTextField.text!, user: self.passwordTextField.text!)
        }
    }
    
    @objc func signUpBottonPressed() {
        let viewController = SignUpRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func forgotPasswordTapped() {
        let viewController = AnimatedAlertRouter.createModule()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid as Any)
        }
    }
}
