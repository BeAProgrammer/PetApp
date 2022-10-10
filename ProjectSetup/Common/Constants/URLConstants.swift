//
//  URLConstants.swift
//  AdSpeak
//
//  Created by Prashant Telangi on 4/13/20.
//  Copyright © 2020 Mobisoft Infotech. All rights reserved.
//

import Foundation

struct URLConstants {
    
    static let baseUrl = "Environment.configuration(.baseUrl)"
    static let updateNotificationSetting = "/api/notifications-settings"
    static func getNotificationSettings(_ userId: String) -> String {
        return "/api/notifications-settings/\(userId)"
    }
    static func getUserProfile(_ userId: String) -> String {
        return "/api/users/\(userId)"
    }
    
}

extension URL {
    static func getFileURL(fileName: String) -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        print(path)
        return path as URL
    }
}
