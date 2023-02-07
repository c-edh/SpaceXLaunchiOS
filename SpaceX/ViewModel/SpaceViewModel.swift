//
//  SpaceViewModel.swift
//  SpaceX
//
//  Created by Corey Edh on 1/6/23.
//

import Foundation

protocol ViewModelProtocol {
    func updateTable()
}

protocol SpaceXViewModelProtocol {
    func getSpaceXData()
    func getRowCount() -> Int
    func getSpaceLaunch(for index: Int) -> SpaceXModel?
    func decodeJSONData(data: Data) -> [SpaceXModel]?
}

class SpaceXViewModel: SpaceXViewModelProtocol {
    
    let apiManager = APIManager()

    var delegate: ViewModelProtocol?
    var spaceXLaunches: [SpaceXModel] = []

    func getSpaceXData() {
        apiManager.getData(urlString: .spaceXLaunches) { data in
            guard let data = data else {
                return
            }
            
            guard let array = self.decodeJSONData(data: data) else {
                return
            }
            
            self.spaceXLaunches = array
            self.delegate?.updateTable()
        }
    }
    
    func decodeJSONData(data: Data) -> [SpaceXModel]? {
        
        let decoder = JSONDecoder()
        
        do {
            let spaceXData = try decoder.decode([SpaceXModel].self, from: data)
            return spaceXData
        } catch {
            print(error)
            return nil
        }
    }
    
    func getRowCount() -> Int {
        return spaceXLaunches.count
    }
    
    func getSpaceLaunch(for index: Int) -> SpaceXModel? {
        if index < spaceXLaunches.count && index > -1 {
            return spaceXLaunches[index]
        }
        
        return nil
            
    }
    
}
