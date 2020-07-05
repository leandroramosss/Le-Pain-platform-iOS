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
        setUpNavigation()
    }
    
    func viewHierarchy() {
        view.addSubview(profileView)
    }
    
    func setupConstranits() {
        profileView.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().offset(50)
            maker.leading.equalToSuperview().offset(20)
        }
    }
    
    func setUpNavigation() {
//        navigationController?.setNavigationBarHidden(false, animated: true)
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
