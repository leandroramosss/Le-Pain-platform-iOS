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
    
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont(name: "Ariel", size: 12)
        return label
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.addSubview(placeholderLabel)
        setUpComponent()
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpComponent()
        configureViews()
    }
    
    func setUpComponent() {
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.contentVerticalAlignment = .bottom
        
    }
    
    func configureViews() {
        placeholderLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.snp.bottom)
            maker.leading.equalTo(self.snp.leading).offset(10)
        }
    }
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateConstraits()
        performAnimation(transform: CGAffineTransform(scaleX: 0.8, y: 0.8))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = self.text, text.isEmpty {
            configureViews()
            performAnimation(transform: CGAffineTransform(scaleX: 1.0, y: 1.0))
        }
        performAnimation(transform: CGAffineTransform(scaleX: 1.0, y: 1.0))
    }
    
    func animateConstraits() {
        placeholderLabel.snp.remakeConstraints { (remaker) in
            remaker.top.equalTo(self.snp.top).offset(0)
            remaker.leading.equalTo(self.snp.leading).offset(10)
        }
    }
        
    func performAnimation(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
          self.placeholderLabel.transform = transform
          self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      return textField.resignFirstResponder()
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
