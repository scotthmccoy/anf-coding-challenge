//
//  ExploreCardViewModelTest.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/16/25.
//

import Foundation

import Foundation
import XCTest
@testable import ANF_Code_Test

class ExploreCardViewModelTests: XCTestCase, @unchecked Sendable {

    // These vars are for ProductsRepositoryProtocol
    @Published var products = [Product]()
    @Published var errorMessage: String?
    
    // Expectations
    var expectationFetch: XCTestExpectation?
    var expectationProductsPublisher: XCTestExpectation?
    
    @MainActor
    func test() async {
        
        // Create sut & validate:
        // Products publisher should get accessed (for the sink)
        // Products should be empty before fetch
        expectationProductsPublisher = self.expectation(description: "expectationProductsPublisher")
        let sut = ExploreCardViewModel(
            productsRepository: self
        )
        await fulfillment(of: [expectationProductsPublisher!])
        XCTAssertEqual(sut.products, [])
        
        
        // Interact with sut. Expect a fetch from onAppear().
        expectationFetch = self.expectation(description: "expectationFetch")
        sut.onAppear()
        await fulfillment(of: [expectationFetch!])
        
        // Validate change in products
        XCTAssertEqual(sut.products, [.stub])
        
        
        // Test Other UI events
        expectationFetch = self.expectation(description: "expectationFetch")
        sut.btnTryAgainTapped()
        await fulfillment(of: [expectationFetch!])
        
        expectationFetch = self.expectation(description: "expectationFetch")
        sut.refresh()
        await fulfillment(of: [expectationFetch!])
    }

}


extension ExploreCardViewModelTests: ProductsRepositoryProtocol {
    var productsPublisher: Published<[Product]>.Publisher {
        expectationProductsPublisher.fulfillOrFail(self)
        return $products
    }

    var errorMessagePublisher: Published<String?>.Publisher {
        $errorMessage
    }
    
    func fetch() async {
        // Send a value through the publisher
        products = [Product.stub]
        expectationFetch.fulfillOrFail(self)
    }
}
