//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Corey Edh on 1/6/23.
//

import XCTest

@testable import SpaceX

final class SpaceXTests: XCTestCase {
    
    var viewModel: SpaceXViewModelMock?

    override func setUpWithError() throws {
        viewModel = SpaceXViewModelMock()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetRowCount() {
        let count = viewModel?.getRowCount()
        XCTAssertEqual(count, 0)
        
        viewModel?.getSpaceXData()

        let count2 = viewModel?.getRowCount()
        XCTAssertEqual(count2, 2)
        
    }
    
    func testGetSpaceLaunch() {
        let launch1 = viewModel?.getSpaceLaunch(for: -1)
        XCTAssertNil(launch1)
        
        let launch2 = viewModel?.getSpaceLaunch(for: 10)
        XCTAssertNil(launch2)
        
        viewModel?.getSpaceXData()
    
        let launch3 = viewModel?.getSpaceLaunch(for: 0)
        XCTAssertNotNil(launch3)

    }
    
    func testDecodeJSON() {
        let spaceXModel1 = SpaceXModel(id: "1", name: "C", details: "B", date_utc: "1/2/3", upcoming: true, success: true, rocket: "rocket")
        
        let spaceXModel2 = SpaceXModel(id: "2", name: "a", details: "c", date_utc: "1/2/4", upcoming: true, success: true, rocket: "rocket2")
        
        let spaceArray: [SpaceXModel] = [spaceXModel1, spaceXModel2]
 
        do {
            let data = try JSONEncoder().encode(spaceArray)
            let decodedData =  viewModel?.decodeJSONData(data: data)
            XCTAssertEqual(spaceArray.count, decodedData?.count)
        } catch {
            XCTFail("Fail to encode in test")
        }
    }
    
}
