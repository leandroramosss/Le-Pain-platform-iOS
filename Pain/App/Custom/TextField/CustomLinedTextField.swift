//
//  CustomLinedTextField.swift
//  Pain
//
//  Created by Leandro Ramos on 7/5/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomLinedTextField: UITextField, UITextFieldDelegate {
    
    var bottomLine = CALayer()
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpComponent()
    }
    
    func setUpComponent() {
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
