//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Corey Edh on 1/6/23.
//

import XCTest

@testable import SpaceX

final class SpaceXTests: XCTestCase {
    
    var viewModel: SpaceXViewModel?


    override func setUpWithError() throws {
        viewModel = SpaceXViewModel()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetRowCount(){
        let count = viewModel?.getRowCount()
        XCTAssertEqual(count, 0)

        let count2 = viewModel?.getRowCount()
        XCTAssertEqual(count2, 1)
        
    }
    
    func testGetSpaceLaunch(){
        let launch1 = viewModel?.getSpaceLaunch(for: -1)
        XCTAssertNil(launch1)
        
        let launch2 = viewModel?.getSpaceLaunch(for: 10)
        XCTAssertNil(launch2)
        
        

        
        let launch3 = viewModel?.getSpaceLaunch(for: 0)
        XCTAssertNotNil(launch3)

    }
    

    
    

}
