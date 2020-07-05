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
    
    let frame = CGRect()
    let transition = CircularTransition()
    
    lazy var profileView: ProfileImageView = {
        let view = ProfileImageView(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileViewTapped))
        view.backgroundColor = .white
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = .blue
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileView)
    }
    
    func setupConstranits() {
        scrollView.snp.makeConstraints { (maker) in
            maker.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            maker.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (maker) in
            maker.top.bottom.equalTo(self.scrollView)
            maker.left.right.equalTo(self.view)
            maker.height.equalTo(1500)
            maker.width.equalTo(self.scrollView)
        }
        
    }
    
    
    func setUpNavigation() {
        title = "Main page title"
//        navigationItem.prompt = "Your prompt text here"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 31, weight: UIFont.Weight.bold)]
        profileView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileView)
        
        let searchController = UISearchController(searchResultsController: nil)// transition resultview example
        navigationItem.searchController = searchController
        navigationItem.searchController?.automaticallyShowsCancelButton = true
        navigationItem.searchController?.automaticallyShowsSearchResultsController = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    func setUpWelcomeLabel() {
        let username = manager.getUsername()
        welcomeLabel.text = "Welcome, \(username)"
    }
    
    @objc func handleProfileViewTapped(_ sender: UITapGestureRecognizer? = nil) {
        print("tapped")
        let viewController = ProfileRouter.createModule()
        viewController.transitioningDelegate = self
        viewController.modalPresentationStyle = .custom
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}

extension MainPageViewController: UIViewControllerTransitioningDelegate {
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
