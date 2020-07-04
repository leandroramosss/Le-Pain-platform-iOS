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
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        constraits()
        startAnimation()
    }
        
    func constraits() {
        self.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(40)
        }
    }
    
    func startAnimation() {
        self.animation = Animation.named("emptyProfileAnimation")
        self.contentMode = .scaleAspectFit
        self.play()
    }
}
