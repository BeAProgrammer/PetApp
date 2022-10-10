//
//  UIViewExtension.swift
//  AdSpeak
//
//  Created by Shreyas Ranade on 08/04/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//
import UIKit

extension UIView {
    
    func setshadowWithBlur(color: UIColor, xPoint: CGFloat, yPoint: CGFloat, blur: CGFloat, spread: CGFloat) {
        self.layer.applySketchShadow(color: color, alpha: 0.24, xPoint: xPoint, yPoint: yPoint, blur: blur, spread: spread)
        self.layer.masksToBounds = false
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    @objc class public var identifier: String {
        return String(describing: self)
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
