//
//  DataStructs.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

// Data Objects exist to be a faithful recreation of the stucture of the API's json response; they help us
// maintain a contract with the API.
// All fields are optional so as to be more flexible with decoding and to help respond to unexpected changes to the API's structure.
// Data objects convert themselves to Domain Objects which are structured for consistency and ease of use to the ViewModel & View programmer.

struct ProductDataObject {
    let title: String?
    let backgroundImage: String?
    let content: [ProductContentDataObject]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
    
    var product: Product? {
        
        guard let title,
        let backgroundImage,
        let backgroundImageUrl = URL(string: backgroundImage) else {
            return nil
        }
        
        return Product(
            title: title,
            backgroundImageUrl: backgroundImageUrl,
            content: content?.compactMap { $0.productContent } ?? [],
            promoMessage: promoMessage ?? "",
            topDescription: topDescription ?? "",
            bottomDescription: bottomDescription ?? ""
        )
        
    }
}
extension ProductDataObject: Codable, Equatable {}

struct ProductContentDataObject: Codable, Equatable {
    let target: String?
    let title: String?
    let elementType: String?
    
    var productContent: ProductContent? {
        nil
    }
}
