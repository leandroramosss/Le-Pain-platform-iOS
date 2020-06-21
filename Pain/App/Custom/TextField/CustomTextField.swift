//
//  CustomTextField.swift
//  Pain
//
//  Created by Leandro Ramos on 6/21/20.
//  Copyright © 2020 Black Beard Games. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
        
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 2, right: 5)
    
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
