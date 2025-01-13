//
//  DataStructsTests.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

import XCTest
@testable import ANF_Code_Test

class DataStructsTestsTests: XCTestCase {
    func test() {
        
        
        
        guard let jsonUrl = Bundle(for: Self.self)
        .url(forResource: "exploreData.json", withExtension: nil) else {
            XCTFail("Could not make url")
            return
        }
        
        guard let data = try? Data(contentsOf: jsonUrl) else {
            XCTFail("Could not get data")
            return
        }
        
        
        let result = CodableHelper().decode(
            type: [ProductDataObject].self,
            from: data
        )
        
        guard let productDataObjects = result.getSuccess() else {
            XCTFail("Could not get products: \(result)")
            return
        }
        
        
        XCTAssertEqual(productDataObjects.count, 10)
        
    }
    
}
