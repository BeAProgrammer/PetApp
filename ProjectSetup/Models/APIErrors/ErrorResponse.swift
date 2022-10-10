//
//  ErrorResponse.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 3/18/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    var messageCode: String, message: String
}
