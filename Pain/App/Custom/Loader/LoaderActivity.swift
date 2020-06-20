//
//  LoaderActivity.swift
//  Pain
//
//  Created by Leandro Ramos on 6/20/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class LoaderActivity: UIView {
    
    static let instance = LoaderActivity()
    
    var animationView = AnimationView()
    
    func showActivityLoader() {
        self.addSubview(animationView)
        animationView.animation = Animation.named("loading")
        animationView.frame = self.bounds
        animationView.backgroundColor = .black
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func hideLoader() {
        self.animationView.removeFromSuperview()
    }
    
}
