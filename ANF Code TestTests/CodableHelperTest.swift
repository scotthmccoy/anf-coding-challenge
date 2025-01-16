//
//  CodableHelperTest.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/16/25.
//

import Foundation

import Foundation

import XCTest
import Scootys_Unit_Testing

@testable import ANF_Code_Test

class CodableHelperTests: XCTestCase {
    
    func test() {
        
        let productDataObject = ProductDataObject.stub
        
        // Interact with sut - encode
        let encodingResult = CodableHelper().encode(value: productDataObject)
        guard case let .success(data) = encodingResult else {
            XCTFail("\(encodingResult.error!)")
            return
        }
        
        // Interact with sut - decode
        let decodingResult = CodableHelper().decode(
            type: ProductDataObject.self,
            from: data
        )

        guard case let .success(decodedProductDataObject) = decodingResult else {
            XCTFail("\(decodingResult.error!)")
            return
        }
        
        // Validate
        XCTAssertEqualEncodable(expected: productDataObject, actual: decodedProductDataObject)
    }
    
    func testPrettyPrint() {
        let jsonString = "[]"
        guard let data = jsonString.data(using: .utf8) else {
            XCTFail("Could not make data")
            return
        }
        
        // Interact with sut - decode
        let decodingResult = CodableHelper().decode(
            type: ProductDataObject.self,
            from: data
        )
        
        guard case let .failure(codableHelperError) = decodingResult else {
            XCTFail("Expected failure: \(decodingResult)")
            return
        }
        
        guard case let .decodingError(errorString, decodedJsonString) = codableHelperError else {
            XCTFail("Incorrect error: \(codableHelperError)")
            return
        }
        
        XCTAssertEqual(errorString, "typeMismatch(Swift.Dictionary<Swift.String, Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: \"Expected to decode Dictionary<String, Any> but found an array instead.\", underlyingError: nil))")
        XCTAssertEqual(decodedJsonString, "[\n\n]")
    }
    
}
