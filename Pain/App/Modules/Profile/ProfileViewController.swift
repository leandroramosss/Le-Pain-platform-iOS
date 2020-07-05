//
//  ProfileViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit
import Lottie

class ProfileViewController: UIViewController {
    
    var presenter: ViewToProfilePresenterProtocol?
    let transition = CircularTransition()
    let frame = CGRect()
    let manager = UserManager()
    var animationView = AnimationView()
    
    lazy var profileView: ProfileImageView = {
        let view = ProfileImageView(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileViewTapped))
        view.backgroundColor = .white
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var profileTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Profile"
        return label
    }()

    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("logout", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapSignout), for: .touchUpInside)
        return button
    }()
    
    lazy var nameTextField: CustomLinedTextField = {
        let textfield = CustomLinedTextField()
        textfield.text = manager.getUserEmail()
        return textfield
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
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
    
}

extension ProfileViewController: PresenterToProfileProtocol {
    func didEndRequestSuccesfully() {
        self.animationView.removeFromSuperview()
        let viewController = LoginRouter.createModule()
        let rootViewController = UINavigationController(rootViewController: viewController)
        rootViewController.modalPresentationStyle = .fullScreen
        present(rootViewController, animated: true, completion: nil)

    }
    
}

extension ProfileViewController: ViewLayoutProtocol, UIViewControllerTransitioningDelegate {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        view.addSubview(profileView)
        view.addSubview(profileTitle)
        view.addSubview(nameTextField)
        view.addSubview(logoutButton)
    }
    
    func setupConstranits() {
        profileView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            maker.leading.equalToSuperview().offset(17)
        }
        
        profileTitle.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            maker.leading.equalTo(profileView.snp.trailing).offset(20)
            maker.trailing.equalToSuperview().offset(-20)
            maker.height.equalTo(40)
        }
        
        logoutButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(profileTitle.snp.bottom).offset(10)
            maker.height.equalTo(40)
            maker.width.equalTo(100)
        }
        
        nameTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(profileView.snp.bottom).offset(30)
            maker.width.equalToSuperview().inset(20)
            maker.height.equalTo(40)
            maker.centerX.equalToSuperview()
        }
    }
        
    @objc func handleProfileViewTapped() {
        print("touthed")
        let viewController = MainPageRouter.createModule()
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .custom
        self.dismiss(animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = profileView.center
        transition.circleColor = profileView.backgroundColor!
        return transition
    }

    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = profileView.center
        transition.circleColor = profileView.backgroundColor!
        return transition
    }
    
    @objc func didTapSignout() {
        startAnimation()
        self.view.addSubview(animationView)
        self.view.endEditing(true)
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 2.0) {
            self.presenter?.signOutUser()
        }
    }
}
