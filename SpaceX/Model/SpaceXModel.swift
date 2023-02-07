//
//  SpaceXModel.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import Foundation

struct SpaceXModel: Codable {
    
        let id: String?
        let name: String?
        let details: String?
        let date: String?
        let upcoming: Bool?
        let success: Bool?
        let rocket: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case details = "details"
        case date = "date_utc"
        case upcoming = "upcoming"
        case success = "success"
        case rocket = "rocket"
    }
}
