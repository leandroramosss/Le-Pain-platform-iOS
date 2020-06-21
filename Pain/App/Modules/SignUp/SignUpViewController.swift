//
//  SignUpViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit
import Lottie
import NotificationCenter

class SignUpViewController: UIViewController {
    
    var presenter: ViewToSignUpPresenterProtocol?
    let animamationView = AnimationView()
    
    lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "CustomNavigation")
        view.contentMode = .scaleToFill
        return view
    }()
    
    lazy var emailTextfield: CustomTextField = {
        let textField = CustomTextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.placeholder = "password"
        textField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
}

extension SignUpViewController: PresenterToSignUpProtocol {
    func endRequestSuccessfully() {
        let viewController = MainPageRouter.createModule()
        self.navigationController?.present(viewController, animated: true, completion: nil)
        self.navigationController?.popToViewController(viewController, animated: true)
    }
    
    func endRequestWithError(alert: UIAlertController) {
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            // do nothing
        }))
        present(alert, animated: true)
    }
    
    func showAlert(alert: UIAlertController, valid: Bool) {
        if !valid {
            alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: { (action) in
            }))
            present(alert, animated: true)
        }
    }
    
}

extension SignUpViewController: ViewLayoutProtocol, UITextFieldDelegate {
    func setUpLayout() {
        setUpNavigation()
        viewHierarchy()
        setupConstranits()
        handleTextFields()
    }
    
    func viewHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(userNameTextField)
        view.addSubview(continueButton)
        view.addSubview(animamationView)
    }
    
    func setupConstranits() {
        
        backgroundView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(192)
        }
        
        
        emailTextfield.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(emailTextfield.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        userNameTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordTextField.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        continueButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(userNameTextField.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
    }
    
    func setUpNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Subscription"
        navigationController?.navigationBar.prefersLargeTitles = true
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navigationController!.navigationBar)
            navController.view.backgroundColor = .white
        }
        
    }
    
    func handleTextFields() {
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        userNameTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @objc func continueButtonTapped() {
        if emailTextfield.text?.isEmpty == true {
            print("email empty")
        } else if passwordTextField.text?.isEmpty == true {
            print("password empty")
        } else {
            self.navigationController!.navigationBar.layer.zPosition = -1
            startAnimation()
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) {
                self.presenter?.createUser(email: self.emailTextfield.text ?? "", passWord: self.passwordTextField.text ?? "")
            }
        }
    }
    
    func startAnimation() {
        animamationView.animation = Animation.named("loading")
        animamationView.frame = view.bounds
        animamationView.backgroundColor = .black
        animamationView.contentMode = .scaleAspectFit
        animamationView.loopMode = .loop
        animamationView.play()
    }
}
