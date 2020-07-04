//
//  MainPageViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 5/25/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import Lottie

class MainPageViewController: UIViewController {
    
    var presenter: ViewToMainPagePresenterProtocol?
    var manager = UserManager()
    
    lazy var customNavigationBar: UINavigationBar = {
        let bar = UINavigationBar()
        return bar
    }()
    
    lazy var profileView: AnimationView = {
        let image = AnimationView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileViewTapped))
        image.addGestureRecognizer(tap)
        image.animation = Animation.named("emptyProfileAnimation")
        return image
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemBackground
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        view.backgroundColor = .white
    }
    
}

extension MainPageViewController: PresenterToMainPageProtocol {
    
}

extension MainPageViewController: ViewLayoutProtocol {
    
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
        setUpWelcomeLabel()
        setUpNavigation()
        startAnimation()
    }
    
    func viewHierarchy() {
        view.addSubview(welcomeLabel)
//        view.addSubview(customNavigationBar)
//        customNavigationBar.addSubview(profileView)
//        customNavigationBar.backgroundColor = UIColor.white
    }
    
    func setupConstranits() {
//        customNavigationBar.snp.makeConstraints { (maker) in
//            maker.top.equalToSuperview()
//            maker.width.equalToSuperview()
//            maker.height.equalTo(120)
//        }
//
//        profileView.snp.makeConstraints { (maker) in
//            maker.top.equalTo(view.safeAreaLayoutGuide).offset(10)
//            maker.bottom.equalTo(customNavigationBar.snp.bottom).offset(-10)
//            maker.leading.equalTo(customNavigationBar.snp.leading).offset(10)
//            maker.width.equalTo(100)
//        }
//
//        welcomeLabel.snp.makeConstraints { (maker) in
//            maker.center.equalToSuperview()
//            maker.width.equalToSuperview().inset(16)
//            maker.height.equalTo(30)
//            maker.width.equalTo(50)
//        }
    }
    
    func startAnimation() {
        profileView.play()
        profileView.contentMode = .scaleAspectFit
    }
    
    func setUpNavigation() {
        title = "Main page title"
        navigationController?.setNavigationBarHidden(false, animated: true)
        if let navController = navigationController {
            System.navigationBarWhite(forBar: navigationController!.navigationBar)
            navController.view.backgroundColor = .blue
        }
    }
    
    func setUpWelcomeLabel() {
        let username = manager.getUsername()
        welcomeLabel.text = "Welcome, \(username)"
    }
    
    @objc func handleProfileViewTapped(_ sender: UITapGestureRecognizer? = nil) {        
        if let vc = UIStoryboard(name: "ProfileStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
                    vc.modalPresentationStyle = .overCurrentContext
                    self.present(vc, animated: false, completion: nil)
                }
        
    }
    
}
