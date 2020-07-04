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
//        setUpImageView()
        constraits()
        startAnimation()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setUpImageView()
        constraits()
        startAnimation()
    }
    
    func setUpImageView() {
    }
    
    func constraits() {
        self.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(40)
        }
    }
    
    func startAnimation() {
    }
    
}
