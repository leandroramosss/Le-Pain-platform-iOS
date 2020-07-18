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
import Firebase

class SignUpViewController: UIViewController {
    
    var presenter: ViewToSignUpPresenterProtocol?
    let animamationView = AnimationView()
    let date = Date()
    let formatter = DateFormatter()
    let years = (1900...2120).map{String($0)}
    let days = (1...31).map{String($0)}
    var pickerMonth: [String] = [String]()
    var pickerDay: [String] = [String]()
    var pickYears: [String] = [String]()
    var selectedMonth: String?
    var selectedDay: String?
    var selectedYear: String?
    let db = Firestore.firestore()
    
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
    
    lazy var ageTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.autocapitalizationType = .none
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(string: "birthdate", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        return textField
    }()
    
    lazy var datePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .clear
        picker.setValue(UIColor.black, forKeyPath: "textColor")
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        view.backgroundColor = .white
        setUpLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpLayout()
    }
    
}

extension SignUpViewController: PresenterToSignUpProtocol {
    func endRequestSuccessfully() {
        let viewController = LoginRouter.createModule()
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
        handleGeneralDelegation()
        datePickerComponents()
    }
    
    func viewHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextField)
        view.addSubview(userNameTextField)
        view.addSubview(ageTextField)
        view.addSubview(datePicker)
        view.addSubview(continueButton)
        view.addSubview(animamationView)
    }
    
    func setupConstranits() {
        
        backgroundView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(200)
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
        
        ageTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(userNameTextField.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
        
        datePicker.snp.makeConstraints { (maker) in
            maker.top.equalTo(ageTextField.snp.bottom).offset(30)
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.height.equalTo(100)
        }
        
        continueButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(datePicker.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(16)
            maker.centerX.equalToSuperview()
            maker.height.equalTo(40)
        }
    }
    
    func saveUserName() {
        let usernameTapped = userNameTextField.text
        print(usernameTapped as Any)
        presenter?.setUsername(username: usernameTapped!)
    }
    
    func setUpNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Subscription"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always;
        if let navController = navigationController {
            System.clearNavigationBar(forBar: navigationController!.navigationBar)
            navController.view.backgroundColor = .white
        }
        
    }
    
    func handleGeneralDelegation() {
        emailTextfield.delegate = self
        passwordTextField.delegate = self
        userNameTextField.delegate = self
        datePicker.delegate = self
        datePicker.dataSource = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @objc func continueButtonTapped() {
        self.navigationController!.navigationBar.layer.zPosition = -1
        startAnimation()
        saveUserName()
        self.createUserData()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) {
            self.presenter?.createUser(email: self.emailTextfield.text ?? "", passWord: self.passwordTextField.text ?? "")
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

extension SignUpViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerMonth.count//month
        }else if component == 1 {
            return pickerDay.count//day
        }else {
            return pickYears.count//year
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        ageTextField.text = pickerMonth[pickerView.selectedRow(inComponent:0)]
            + " / " +
            pickerDay[pickerView.selectedRow(inComponent:1)]
            + " / " +
            pickYears[pickerView.selectedRow(inComponent:2)]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return pickerMonth[row]
        }else if component == 1 {
            return pickerDay[row]
        }else {
            return pickYears[row]
        }
    }
    
    func datePickerComponents() {
        pickerMonth = formatter.shortMonthSymbols
        pickerDay = days
        pickYears = years
    }
    
    func createUserData() {
        db.collection("user").addDocument(data: ["email": emailTextfield.text!,
                                                 "password": passwordTextField.text!])
    }

}
