//
//  tf_mars_appTests.swift
//  tf-mars-appTests
//
//  Created by Hoang Duc Nguyen on 01.03.19.
//  Copyright © 2019 Hoang Duc Nguyen. All rights reserved.
//

import XCTest
@testable import tf_mars_app

class tf_mars_appTests: XCTestCase {
    
    let tfmPropertyModels = TFMPropertyViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Number of cells
    
    func testNumberOfCells() {
        // WHEN
        let result = tfmPropertyModels.tfmProperties.count
        let expectedNumber = 6
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    // MARK: - Minimum production
    
    func testMinimumProductionNumberMegaCredit() {
        // WHEN
        let result = tfmPropertyModels.megaCredit.minimumProductionNumber
        let expectedNumber = -10
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }

    func testMinimumProductionNumberSteel() {
        // WHEN
        let result = tfmPropertyModels.steel.minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    func testMinimumProductionNumberTitan() {
        // WHEN
        let result = tfmPropertyModels.titan.minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    func testMinimumProductionNumberPlant() {
        // WHEN
        let result = tfmPropertyModels.plant.minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    func testMinimumProductionNumberEnergy() {
        // WHEN
        let result = tfmPropertyModels.energy.minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    func testMinimumProductionNumberHeat() {
        // WHEN
        let result = tfmPropertyModels.heat.minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    // MARK: - Maximum production

    func testMaximumProductionValue() {
        // WHEN
        let resultList = tfmPropertyModels.tfmProperties
        
        resultList.forEach { model in
            let result = model.maximumProductionNumber
            let expectedNumber = 30

            // THEN
            XCTAssertEqual(result, expectedNumber)
        }
    }
    
    // MARK: - Minimum quantity
    
    func testMinimumQuantityValue
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
