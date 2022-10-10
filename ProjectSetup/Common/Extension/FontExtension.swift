//
//  FontExtension.swift
//  TexasNerve
//
//  Created by Prashant Telangi on 3/9/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

extension UIFont {
    
    struct Theme {
        static var interSemiBold30: UIFont { return UIFont(name: FontConstants.interSemiBold, size: 30)! }
        static var interSemiBold20: UIFont { return UIFont(name: FontConstants.interSemiBold, size: 20)! }
        static var interSemiBold17: UIFont { return UIFont(name: FontConstants.interSemiBold, size: 17)! }
        static var interSemiBold15: UIFont { return UIFont(name: FontConstants.interSemiBold, size: 15)! }
        static var interSemiBold13: UIFont { return UIFont(name: FontConstants.interSemiBold, size: 13)! }
        static var interMedium24: UIFont { return UIFont(name: FontConstants.interMedium, size: 24)! }
        static var interMedium20: UIFont { return UIFont(name: FontConstants.interMedium, size: 20)! }
        static var interMedium17: UIFont { return UIFont(name: FontConstants.interMedium, size: 17)! }
        static var interMedium15: UIFont { return UIFont(name: FontConstants.interMedium, size: 15)! }
        static var interMedium13: UIFont { return UIFont(name: FontConstants.interMedium, size: 13)! }
        static var interMedium12: UIFont { return UIFont(name: FontConstants.interMedium, size: 12)! }
        static var interRegular30: UIFont { return UIFont(name: FontConstants.interRegular, size: 30)! }
        static var interRegular17: UIFont { return UIFont(name: FontConstants.interRegular, size: 17)! }
        static var interRegular15: UIFont { return UIFont(name: FontConstants.interRegular, size: 15)! }
        static var interRegular13: UIFont { return UIFont(name: FontConstants.interRegular, size: 13)! }
        static var interRegular12: UIFont { return UIFont(name: FontConstants.interRegular, size: 12)! }
        static var interRegular11: UIFont { return UIFont(name: FontConstants.interRegular, size: 11)! }
        
        static func imageFont(size: CGFloat) -> UIFont {
            return UIFont(name: FontConstants.imageFont, size: size)!
        }
    }
}
