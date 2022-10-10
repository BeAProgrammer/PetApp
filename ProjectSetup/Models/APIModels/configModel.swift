//
//  configModel.swift
//  ProjectSetup
//
//  Created by Shreyas on 11/10/22.
//  Copyright © 2022 Shreyas. All rights reserved.
//

import Foundation

// MARK: - Config
struct Config: Codable {
    let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
    let workHours: String
}
