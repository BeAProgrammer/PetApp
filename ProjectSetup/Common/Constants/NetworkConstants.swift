//
//  NetworkConstants.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 3/18/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

enum ContentType: String {
    case json = "application/json"
    case multipart = "multipart/form-data"
    case ENUS = "en-US"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLangauge = "Accept-Language"
    case client = "Client"
}
