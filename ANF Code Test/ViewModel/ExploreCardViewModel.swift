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
    
    init() {
        guard let jsonUrl = Bundle(for: Self.self)
        .url(forResource: "exploreData.json", withExtension: nil) else {
            AppLog("Could not make url")
            return
        }
        
        guard let data = try? Data(contentsOf: jsonUrl) else {
            AppLog("Could not get data")
            return
        }
        
        
        let result = CodableHelper().decode(
            type: [ProductDataObject].self,
            from: data
        )
        
        guard let productDataObjects = result.getSuccess() else {
            AppLog("Could not get products: \(result)")
            return
        }
        
        self.products = productDataObjects.compactMap {
            $0.product
        }
        
        AppLog("products: \(products)")    
    }
}
