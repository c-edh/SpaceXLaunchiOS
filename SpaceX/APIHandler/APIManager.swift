//
//  APIManager.swift
//  SpaceX
//
//  Created by Corey Edh on 12/28/22.
//

import Foundation


protocol APIProtocol{
    
    func finished(_ data: [SpaceXModel])
    
}


class APIManager{
    
    var delegate: APIProtocol?
    
    func getData(urlString: URLs){
        
        guard let url = URL(string: urlString.rawValue)else{
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request){ data, response, error in
            
            
            if error != nil{
                return
            }
            
            guard let data = data,  let spaceXData = self.decodeJSONData(data: data) else{
                return
            }
            

            self.delegate?.finished(spaceXData)
        }
        
        
        task.resume()

    }
    
    
    
    private func decodeJSONData(data: Data) -> [SpaceXModel]?{
        
        let decoder = JSONDecoder()
        
        do{
            let spaceXData = try decoder.decode([SpaceXModel].self, from: data)
            return spaceXData
        }catch{
            print(error)
            return nil
        }

        
    }
    
    
    
    
}
