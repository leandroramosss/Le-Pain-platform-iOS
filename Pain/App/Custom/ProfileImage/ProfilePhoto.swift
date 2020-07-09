//
//  ProfilePhoto.swift
//  Pain
//
//  Created by Leandro Ramos on 7/9/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import UIKit

class ProfilePhoto: UIView {
    
    lazy var imageView: UIImage = {
        let view = UIImage()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLayout()
    }
    
    func setUpLayout() {
        let rounded = self.bounds.width / 2
        self.layer.cornerRadius = rounded
    }
}
