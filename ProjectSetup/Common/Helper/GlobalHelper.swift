//
//  GlobalHelper.swift
//  ProjectSetup
//
//  Created by Shreyas on 11/10/22.
//  Copyright © 2022 Shreyas. All rights reserved.
//

import UIKit

let GLOBALHELPER = GlobalHelper.sharedGlobalHelper

typealias AnyDict = [String: Any]

private let _sharedGlobalHelper = GlobalHelper()

class GlobalHelper: NSObject {

    class var sharedGlobalHelper: GlobalHelper {
        return _sharedGlobalHelper
    }
    
    
    func validateTime(timeString: String)-> Bool {
        if timeString == "" {
            return false
        }
        let response = timeString
        let pattern = "^[A-Z]-[A-Z]\\s{1}(\\d{1,2}:\\d{2})\\s{1}-\\s{1}(\\d{1,2}:\\d{2})$"
        let regex = try! NSRegularExpression(pattern: pattern)
        if let match = regex.matches(in: response, range: .init(response.startIndex..., in: response)).first,
            match.numberOfRanges == 3 {
            let start1 = match.range(at: 0)
            print(response[Range(start1, in: response)!])
            
            let start = response[Range(match.range(at: 1), in: response)!].replacingOccurrences(of: ":", with: ".")
            let end = response[Range(match.range(at:2), in: response)!].replacingOccurrences(of: ":", with: ".")
            
            let startDouble = Double(start) ?? 0.0
            let endDouble = Double(end) ?? 0.0
            
            let date = Date()
            let dateComponents = Calendar.current.dateComponents([.hour,.minute], from: date)
            let hour = dateComponents.hour ?? 0
            let min = dateComponents.minute ?? 0
            
            let currentTime = Double("\(hour).\(min)") ?? 0.0
            
            if currentTime > startDouble && currentTime < endDouble {
                return true
            } else {
                return false
            }
        }
        return false
    }
    
}
