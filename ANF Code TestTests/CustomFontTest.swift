//
//  CustomFontTest.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/16/25.
//

import Foundation
import XCTest
@testable import ANF_Code_Test

class CustomFontTests: XCTestCase, @unchecked Sendable {
    
    // TODO: This could use some actual assertions
    func test() {
        CustomFont.allCases.forEach {
            XCTAssertTrue($0.internalName != "")
        }
    }
}
    
    
