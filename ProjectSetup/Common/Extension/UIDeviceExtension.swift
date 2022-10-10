//
//  UIDeviceExtension.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 5/7/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit

extension UIDevice {

    var hasNotch: Bool {

        guard #available(iOS 11.0, *), let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top, topPadding > 20 else {
            return false
        }
        return true
    }
}
