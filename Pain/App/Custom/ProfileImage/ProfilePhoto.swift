//
//  ProfilePhoto.swift
//  Pain
//
//  Created by Leandro Ramos on 7/9/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit
import SnapKit

class ProfilePhoto: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        makeConstraits()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLayout()
        makeConstraits()
    }
    
    func setUpLayout() {
        self.backgroundColor = .orange
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    func makeConstraits() {
        self.snp.makeConstraints { (maker) in
            maker.height.width.equalTo(40)
        }
    }
    
}
