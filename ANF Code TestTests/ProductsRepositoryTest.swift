//
//  ProductsRepositoryTest.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/17/25.
//

import Foundation

import XCTest
import Scootys_Unit_Testing
@testable import ANF_Code_Test

final class ProductsRepositoryTests: XCTestCase, @unchecked Sendable {
    
    var getResult: Result<[Product], ProductsRepositoryDataProviderError> = .success([Product.stub])
    
    override func setUp() async throws {
        getResult = .success([Product.stub])
    }
    
    @MainActor
    func test() async {
        
        // Create sut
        let sut = ProductsRepository(
            productsRepositoryDataProvider: self
        )
        XCTAssertEqual(sut.errorMessage, nil)
        XCTAssertEqual(sut.products, [])
        
        // Interact with sut
        await sut.fetch()
        XCTAssertEqual(sut.errorMessage, nil)
        XCTAssertEqual(sut.products, [Product.stub])
        
        // Now, change response from DataProvider
        getResult = .failure(.apiError(.invalidUrl))
        
        // Interact with sut
        await sut.fetch()
        XCTAssertEqual(sut.errorMessage, "apiError(ANF_Code_Test.ANFAPIError.invalidUrl)")
        XCTAssertEqual(sut.products, [Product.stub])
    }
}

extension ProductsRepositoryTests: ProductsRepositoryDataProviderProtocol {
    func get() async -> Result<[Product], ProductsRepositoryDataProviderError> {
        return getResult
    }
}
