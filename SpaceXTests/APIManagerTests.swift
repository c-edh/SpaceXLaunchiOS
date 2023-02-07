//
//  APIManagerTests.swift
//  SpaceXTests
//
//  Created by Corey Edh on 1/6/23.
//

import XCTest
@testable import SpaceX

final class APIManagerTests: XCTestCase {

    var apiManager: APIManagerMock?
    
    override func setUpWithError() throws {
        
        apiManager = APIManagerMock()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        apiManager = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetData() {
        apiManager?.getData(urlString: .spaceXLaunches, completion: { data in
            XCTAssertNotNil(data)
        })
        
    }

}
