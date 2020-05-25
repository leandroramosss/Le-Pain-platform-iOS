//
//  LoginViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: ViewToLoginPresenterProtocol?

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpNavigation()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        let controller = SignUpRouter.createModule()
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension LoginViewController: PresenterToLoginProtocol {
    
}

extension LoginViewController: ViewLayoutProtocol {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        
    }
    
    func setupConstranits() {
        
    }
    
    func setUpNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
