//
//  ProfileViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/28/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var presenter: ViewToProfilePresenterProtocol?
    let transition = CircularTransition()
    let frame = CGRect()
    
    lazy var profileView: ProfileImageView = {
        let view = ProfileImageView(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileViewTapped))
        view.backgroundColor = .white
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var nameTextField: CustomLinedTextField = {
        let textfield = CustomLinedTextField()
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
    
}

extension ProfileViewController: PresenterToProfileProtocol {
    
}

extension ProfileViewController: ViewLayoutProtocol, UIViewControllerTransitioningDelegate {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        view.addSubview(profileView)
        view.addSubview(nameTextField)
    }
    
    func setupConstranits() {
        profileView.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            maker.leading.equalToSuperview().offset(20)
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
    
}
