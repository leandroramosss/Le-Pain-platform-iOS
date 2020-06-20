//
//  LoaderViewController.swift
//  Pain
//
//  Created by Leandro Ramos on 6/13/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit
import Lottie

class LoaderViewController: UIViewController {
    
    var presenter: ViewToLoaderPresenterProtocol?
    static let instance = LoaderViewController()
    
    lazy var animationView: AnimationView = {
        let view = AnimationView()
        view.backgroundColor = .black
        view.animation = Animation.named("loading")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        loaderAnimation()
    }
}

extension LoaderViewController: PresenterToLoaderProtocol {
    
}

extension LoaderViewController: ViewLayoutProtocol {
    func setUpLayout() {
        viewHierarchy()
        setupConstranits()
    }
    
    func viewHierarchy() {
        view.addSubview(animationView)
    }
    
    func setupConstranits() {
        
        animationView.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.width.height.leading.trailing.equalToSuperview()
        }
        
    }
    
    func loaderAnimation() {
        view.bringSubviewToFront(animationView)
        animationView.play()
        animationView.loopMode = .loop
    }
    
    func hideLoader() {
        self.animationView.removeFromSuperview()
    }
    
}
