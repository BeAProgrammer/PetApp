import Foundation
import UIKit

extension CALayer {
    func applySketchShadow(color: UIColor = .black, alpha: Float = 0.5, xPoint: CGFloat = 0, yPoint: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: xPoint, height: yPoint)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let deltaX = -spread
            let rect = bounds.insetBy(dx: deltaX, dy: deltaX)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
