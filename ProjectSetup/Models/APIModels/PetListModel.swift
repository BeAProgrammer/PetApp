//
//  PetListModel.swift
//  ProjectSetup
//
//  Created by Shreyas on 09/10/22.
//  Copyright © 2022 Shreyas. All rights reserved.
//

import Foundation

// MARK: - PetList
struct PetList: Codable {
    let pets: [Pet]
}

// MARK: - Pet
struct Pet: Codable {
    let imageURL: String
    let title: String
    let contentURL: String
    let dateAdded: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title = "title"
        case contentURL = "content_url"
        case dateAdded = "date_added"
    }
}
