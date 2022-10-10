//
//  ImageViewExtension.swift
//  AdSpeak
//
//  Created by Shreyas Ranade on 28/05/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import UIKit
import AVFoundation
extension UIImage {
    convenience init?(withContentsOfUrl imageUrlString: String) throws {
        let imageUrl = URL(string: imageUrlString)!
        let imageData = try Data(contentsOf: imageUrl)
        
        self.init(data: imageData)
    }
}
