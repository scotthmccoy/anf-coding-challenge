//
//  DomainStructs.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

struct Product {
    let title: String
    let backgroundImageUrl: URL
    let content: [ProductContent]
    let promoMessage: String
    let topDescription: String
    let bottomDescription: String
}
extension Product: Hashable {}

struct ProductContent {
    let target: String
    let title: String
    let elementType: String
}
extension ProductContent: Hashable {}
