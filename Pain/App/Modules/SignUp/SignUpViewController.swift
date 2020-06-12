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

class SignUpViewController: UIViewController {
    
    var presenter: ViewToSignUpPresenterProtocol?
    let animamationView = AnimationView()
    
    
    lazy var emailTextfield: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
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
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(continueButton)
        view.addSubview(animamationView)
    }
    
    func setupConstranits() {
        
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
