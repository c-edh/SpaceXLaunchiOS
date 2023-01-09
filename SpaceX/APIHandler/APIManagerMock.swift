//
//  APIManagerMock.swift
//  SpaceX
//
//  Created by Corey Edh on 1/6/23.
//

import Foundation

class APIManagerMock:APIManagerProtocol{
    func getData(urlString: URLs, completion: @escaping (Data?) -> ()) {
        let spaceXModel1 = SpaceXModel(id: "1", name: "C", details: "B", date_utc: "1/2/3", upcoming: true, success: true, rocket: "rocket")
        
        let spaceXModel2 = SpaceXModel(id: "2", name: "a", details: "c", date_utc: "1/2/4", upcoming: true, success: true, rocket: "rocket2")
        
        let spaceArray: [SpaceXModel] = [spaceXModel1,spaceXModel2]
        do {
            let data = try JSONEncoder().encode(spaceArray)
            completion(data)
        } catch  {
            print("failed to decode \(error)")
            completion(nil)
        }
        
    }
    
}
