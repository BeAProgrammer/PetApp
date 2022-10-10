//
//  Test.swift
//  TexasNerve
//
//  Created by Abhijit M on 11/03/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setRightViewButton(button: UIButton) {
        
        self.rightViewMode = .always
        
        //        let leftPadding: CGFloat = 5.0
        //        let rightPadding: CGFloat = 5.0
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: button.frame.height))
        
        paddingView.addSubview(button)
        
        self.rightView = paddingView
    }
    
    func initializeTextField(textColor: UIColor, font: UIFont, placeholderText: String, placeholderTextColor: UIColor) {
        self.textColor = textColor
        self.font = font
        self.placeholder = placeholderText
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor])
    }
    
    func addBottomBorder(color: CGColor, borderWidth: CGFloat) {
        let border = CALayer()
        border.borderColor = color
        self.setNeedsLayout()
        self.layoutIfNeeded()
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addBorder() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.Theme.primary.cgColor
        self.layer.masksToBounds = true
    }
    
    func removeBorder() {
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
    }
    
    struct PropertyHolder {
        static var isPasteRestricted: Bool = false
        static var isCopyingRestricted: Bool =  false
        static var isCutRestricted: Bool =  false
        static var isSelectRestricted: Bool = false
        static var isSelectAllRestricted: Bool =  false
        static var isDeleteRestricted: Bool =  false
        static var isActionRestricted: Bool =  false
    }
}
