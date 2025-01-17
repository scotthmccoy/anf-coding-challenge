//
//  ProductsRepository.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//

import Foundation

// ProductsRepository is the source of truth for the rest of the application and interface to the model layer for ViewModels.
// It is observable, provides Domain objects (Products).

@MainActor
protocol ProductsRepositoryProtocol {
    var products: [Product] { get }
    var productsPublisher: Published<[Product]>.Publisher { get }
    
    var errorMessage: String? { get }
    var errorMessagePublisher: Published<String?>.Publisher { get }
    
    func fetch() async
}


@MainActor
final class ProductsRepository: ProductsRepositoryProtocol, ObservableObject {
    
    static let singleton = ProductsRepository()
    
    @Published var products = [Product]()
    var productsPublisher: Published<[Product]>.Publisher {$products}
    
    @Published var errorMessage: String? = nil
    var errorMessagePublisher: Published<String?>.Publisher {$errorMessage}
    
    private let productsRepositoryDataProvider: ProductsRepositoryDataProviderProtocol
    
    // MARK: - init
    init(
        productsRepositoryDataProvider: ProductsRepositoryDataProviderProtocol = ProductsRepositoryDataProvider(.live)
    ) {
        AppLog()
        self.productsRepositoryDataProvider = productsRepositoryDataProvider
    }


    func fetch() async {
        AppLog()
        let result = await productsRepositoryDataProvider.get()
        switch result {
            case .success(let products):
                self.products = products
            case .failure(let productsRepositoryDataProviderError):
                self.errorMessage = "\(productsRepositoryDataProviderError)"
        }
    }
}
