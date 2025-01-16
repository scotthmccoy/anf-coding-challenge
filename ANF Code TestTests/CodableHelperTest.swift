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
        
        let encodingResult = CodableHelper().encode(value: productDataObject)
        guard case let .success(data) = encodingResult else {
            XCTFail("\(encodingResult.error!)")
            return
        }
        
        let decodingResult = CodableHelper().decode(
            type: ProductDataObject.self,
            from: data
        )

        guard case let .success(decodedProductDataObject) = decodingResult else {
            XCTFail("\(decodingResult.error!)")
            return
        }
        
        XCTAssertEqualEncodable(expected: productDataObject, actual: decodedProductDataObject)
    }
    
}
