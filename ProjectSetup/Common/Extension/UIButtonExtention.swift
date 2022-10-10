//
//  Test.swift
//  TexasNerve
//
//  Created by Abhijit M on 11/03/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configure(title: String, color: UIColor, font: UIFont, backgroundColor: UIColor? = nil) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        
        if backgroundColor != nil {
            self.backgroundColor = backgroundColor
        } else {
            self.backgroundColor = .clear
        }
        
        self.isExclusiveTouch = true
        self.titleLabel?.font = font
    }
    
    func addBottomBorder(color: CGColor?, height: CGFloat ) {
        let border = CALayer()
        border.backgroundColor = color
        self.setNeedsLayout()
        self.layoutIfNeeded()
        border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: height)
        border.borderWidth = height
        self.layer.addSublayer(border)
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func active() {
        self.setTitleColor(UIColor.Theme.text1, for: .normal)
        self.isUserInteractionEnabled = true
        self.backgroundColor = UIColor.Theme.primary
    }
    
    func deActivate() {
        self.setTitleColor(UIColor.Theme.denotive2, for: .normal)
        self.isUserInteractionEnabled = false
        self.backgroundColor = UIColor.Theme.text7
    }
    
    func enable() {
        self.isUserInteractionEnabled = true
        self.alpha = 1
    }
    
    func disable() {
        self.isUserInteractionEnabled = false
        self.alpha = 0.5
    }
    
    func addSpacing() {
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
        self.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func initializeImageButton(title: String, textColor: UIColor, backgroundColor: UIColor, fontSize: CGFloat) {
        self.isAccessibilityElement = true
        self.accessibilityTraits = .button
        self.accessibilityLabel = title
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = UIFont.Theme.imageFont(size: fontSize)
    }
}
