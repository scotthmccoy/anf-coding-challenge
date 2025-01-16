//
//  ProductsRepositoryDataProviderTests.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/16/25.
//

import XCTest
import Scootys_Unit_Testing
@testable import ANF_Code_Test

final class ProductsRepositoryDataProviderTests: XCTestCase, @unchecked Sendable {

    var apiReturn: Result<[Product], ANFAPIError> = .success([.stub])
    
    override func setUp() {
        apiReturn = .success([.stub])
    }
    
    func testHappyPath() async {
        // Configure test
        let sut = ProductsRepositoryDataProvider(
            .live,
            anfApi: self
        )
        
        // Interact with sut
        let actual = await sut.get()
        
        // Validate
        let expected: Result<[Product], ProductsRepositoryDataProviderError> = .success([.stub])
        XCTAssertEqual(actual, expected)
    }
    
    func testError() async {
        // Configure test
        apiReturn = .failure(.invalidUrl)
        let sut = ProductsRepositoryDataProvider(
            .live,
            anfApi: self
        )
        
        // Interact with sut
        let actual = await sut.get()
        
        // Validate
        let expected: Result<[Product], ProductsRepositoryDataProviderError> = .failure(.apiError(.invalidUrl))
        XCTAssertEqual(actual, expected)
    }
    
    func testMainBundleTestData() async {
        // Configure test
        let sut = ProductsRepositoryDataProvider(
            .mainBundleTestData,
            anfApi: self
        )
        
        // Interact with sut
        let actual = await sut.get()
        
        // Validate
        let products = [
            Product(
                backgroundImageUrl: URL(string:  "bad")!,
                topDescription: "A&F ESSENTIALS",
                title: "TOPS STARTING AT $12",
                promoMessage: "This product always fails to load its image",
                bottomDescription: "*In stores & online. <a href=\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160601_Shorts_US.html\">Exclusions apply. See Details</a>",
                productContents: [
                    ProductContent(
                        title: "Shop Men",
                        url: URL(string: "https://www.abercrombie.com/shop/us/mens-new-arrivals")!
                    ),
                    
                    ProductContent(
                        title: "Shop Women",
                        url: URL(string: "https://www.abercrombie.com/shop/us/womens-new-arrivals")!
                    )
                ]
            ),
            Product.stub
        ]
        let expected: Result<[Product], ProductsRepositoryDataProviderError> = .success(products)
        
        XCTAssertEqual(actual, expected)
    }
}

extension ProductsRepositoryDataProviderTests: ANFAPIProtocol {
    func get() async -> Result<[Product], ANFAPIError> {
        return apiReturn
    }
    
    func get(url: URL) async -> Result<[Product], ANFAPIError> {
        return apiReturn
    }
}
