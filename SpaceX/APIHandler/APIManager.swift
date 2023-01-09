//
//  APIManager.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import Foundation




protocol APIManagerProtocol{
    func getData(urlString: URLs, completion: @escaping(Data?) ->())
}

class APIManager: APIManagerProtocol{
    
    func getData(urlString: URLs, completion: @escaping(Data?) ->()){
        
        guard let url = URL(string: urlString.rawValue)else{
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request){ data, response, error in
            
            
            if error != nil{
                return
            }
            
            guard let data = data else{
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        
        task.resume()

    }
}

