//
//  SpaceXModel.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import Foundation


struct SpaceXModel:Decodable{
    
        let id: String?
        let name: String?
        let details: String?
        let date_utc: String?
        let upcoming: Bool?
        let success: Bool?
        let rocket: String?
    
//    
//    enum CodingKeys: CodingKey, String{
//        
//        
//    }
}
