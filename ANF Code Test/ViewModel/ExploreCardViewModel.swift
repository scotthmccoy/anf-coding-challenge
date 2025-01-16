//
//  ExploreCardViewModel.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation
import Combine

@MainActor
class ExploreCardViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private var productsRepository: ProductsRepositoryProtocol
    private var productsSubscription: AnyCancellable?
    private var errorMessageSubscription: AnyCancellable?
    
    init(
        productsRepository: ProductsRepositoryProtocol = ProductsRepository.singleton
    ) {
        self.productsRepository = productsRepository
        
        // Listen for updates from repository
        productsSubscription = productsRepository.productsPublisher.sink { newValue in
            Task { @MainActor in
                AppLog()
                self.products = newValue
            }
        }
    }
    
    func onAppear() {
        Task {
            await productsRepository.fetch()
        }
    }
}
