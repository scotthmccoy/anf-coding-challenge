//
//  ProductsRepositoryDataProvider.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//

import Foundation

// ProductsRepositoryDataProvider encapsulates the process of fetching data from the bundle, an API, or
// some hardcoded results that are useful for supporting Previews.
// This allows the Repository to not have to concern itself with how that gets done.

enum ProductsRepositoryDataProviderSource {
    /// Hits the live API
    case live
    /// Fetches from exploreData.json
    case mainBundleTestData
    /// Always returns an empty set
    case empty
    /// Always returns an error
    case alwaysFail
}


enum ProductsRepositoryDataProviderError: Error, Equatable {
    case noPath
    case dataFetchingError(String)
    case codableHelperError(CodableHelperError)
    case apiError(ANFAPIError)
}


protocol ProductsRepositoryDataProviderProtocol: Sendable {
    func get() async -> Result<[Product], ProductsRepositoryDataProviderError>
}


final class ProductsRepositoryDataProvider: ProductsRepositoryDataProviderProtocol {

    let productsRepositoryDataProviderSource: ProductsRepositoryDataProviderSource
    let anfApi: ANFAPIProtocol
    
    init(
        _ productsRepositoryDataProviderSource: ProductsRepositoryDataProviderSource,
        anfApi: ANFAPIProtocol = ANFAPI.singleton
    ) {
        self.productsRepositoryDataProviderSource = productsRepositoryDataProviderSource
        self.anfApi = anfApi
    }
    
    func get() async -> Result<[Product], ProductsRepositoryDataProviderError> {

        switch productsRepositoryDataProviderSource {
            case .live:
                return await self.anfApi
                    .get()
                    .mapError {
                        .apiError($0)
                    }
                
            case .mainBundleTestData:
                
                // Make a file URL
                guard let path = Bundle.main.path(forResource:"exploreData.json", ofType: nil) else {
                    return .failure(.noPath)
                }
                let url = URL(fileURLWithPath: path)

                // Pass it to the API
                return await self.anfApi
                    .get(url: url)
                    .mapError {
                        // Wrap in
                        .apiError($0)
                    }
                    .map {
                        // If successful, add a product with a bad image so that the test image always displays
                        let badProduct = Product(
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
                        )
                        
                        var products = $0
                        products.insert(badProduct, at:0)
                        return products
                    }

            case .empty:
                return .success([])
                
            case .alwaysFail:
                return .failure(.noPath)
        }
    }
}


