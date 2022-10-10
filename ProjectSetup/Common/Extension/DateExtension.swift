//
//  DateExtension.swift
//  TexasNerve
//
//  Created by Rutwik Mane on 18/03/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(withFormat format: DateFormattes = .dateFormate1) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
   
}
