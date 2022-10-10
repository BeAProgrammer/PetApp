//
//  Test.swift
//  TexasNerve
//
//  Created by Abhijit M on 11/03/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

extension UILabel {

    func configure(text: String, color: UIColor, font: UIFont) {

        self.text = text
        self.textColor = color
        self.font = font
    }
    
    func initializeIconLabel(iconName: String, iconColor: UIColor, size: CGFloat) {

        self.accessibilityElementsHidden = true
        self.text = iconName
        self.textColor = iconColor
        self.font = UIFont.Theme.imageFont(size: size)

    }
}
