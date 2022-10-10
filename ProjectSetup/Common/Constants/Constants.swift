//
//  Constants.swift
//  TexasNerve
//
//  Created by Prashant Telangi on 3/9/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

struct Database {
    static let version = 1
}

struct SessionDataKeys {
    static let sessionKey = "sessionKey"
}

struct ValidationContant {
    static let minimumPhoneNumberLength = 10
    static let maximumPhoneNumberLength = 10
    static let maximumCauseOfInjuryLength = 100
    static let maximumPreviousTreatmentLength = 250
    static let maximumNameLength = 50
    static let maximumEmailLength = 50
    static let ageLimit = 18
    static let zipcodeLimit = 5
}
