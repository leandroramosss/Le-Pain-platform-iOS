//
//  ProfileImageView.swift
//  Pain
//
//  Created by Leandro Ramos on 7/4/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class ProfileImageView: AnimationView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        constraits()
        startAnimation()
        setUpLayout()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        constraits()
        startAnimation()
        setUpLayout()
    }
        
    func constraits() {
        self.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(40)
        }
    }
    
    func startAnimation() {
        self.animation = Animation.named("emptyProfileAnimation")
        self.contentMode = .scaleAspectFit
        self.animationSpeed = 0.9
        self.play()
        self.loopMode = .loop
    }
    
    func setUpLayout() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
