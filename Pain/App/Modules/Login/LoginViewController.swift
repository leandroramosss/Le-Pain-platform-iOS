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
    var animationView = AnimationView()
    
    lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "CustomNavigation")
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var imageView: AnimationView = {
        let image = AnimationView()
//        image.animation = Animation.named("breakfastLogo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Le Pain"
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.isSecureTextEntry = true
        textField.keyboardType = .default
        textField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var securefieldButton: AnimatedButton = {
        let button = AnimatedButton()
        button.animation = Animation.named("secureField")
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(manageSecureField), for: .touchUpInside)
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.setTitle("Login", for: .normal)
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
        setUpLayout()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpNavigation()
//        logoAnimation()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.view.endEditing(true)
    }
    
}

extension LoginViewController: PresenterToLoginProtocol {
    func didEndRequestWithError(alert: AnimatedAlertViewController) {
        self.present(alert, animated: true)
        self.animationView.removeFromSuperview()
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
        keyboardObservers()
        handleTextFields()
        setUpNavigation()
//        logoAnimation()
    }
    
    func viewHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(forgetPassword)
        view.addSubview(securefieldButton)
        view.addSubview(animationView)
    }
    
    func setupConstranits() {
        backgroundView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(340)
        }
        
        imageView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            maker.width.equalToSuperview().inset(25)
            maker.height.equalTo(200)
            maker.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(imageView.snp.bottom).offset(10)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(30)
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
        
        securefieldButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordTextField.snp.top).offset(1)
            maker.trailing.equalTo(passwordTextField.snp.trailing).offset(1)
            maker.bottom.equalTo(passwordTextField.snp.bottom).offset(1)
            maker.width.equalTo(50)
        }
        
        signInButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordTextField.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(100)
            maker.height.equalTo(40)
        }
        
        forgetPassword.snp.makeConstraints { (maker) in
            maker.top.equalTo(signInButton.snp.bottom).offset(15)
            maker.width.equalTo(200)
            maker.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(60)
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func startAnimation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        animationView.animation = Animation.named("loading")
        animationView.frame = view.bounds
        animationView.backgroundColor = .black
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func logoAnimation() {
        imageView.loopMode = .loop
        imageView.play()
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
        self.view.addSubview(animationView)
        self.view.endEditing(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
            self.presenter?.signInUser(user: self.emailTextField.text!, user: self.passwordTextField.text!)
        }
    }
    
    @objc func signUpBottonPressed() {
        let viewController = SignUpRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func forgotPasswordTapped() {
        let viewController = RecoveryPasswordRouter.createModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func manageSecureField(sender: AnimatedButton) {
        self.passwordTextField.isSecureTextEntry.toggle()
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid as Any)
        }
    }
    
    func keyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

}
