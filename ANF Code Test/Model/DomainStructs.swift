//
//  DomainStructs.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

struct Product {
    let backgroundImageUrl: URL
    let topDescription: String
    let title: String
    let promoMessage: String
    let bottomDescription: String
    let productContents: [ProductContent]
}
extension Product: Hashable {}

struct ProductContent {
    let title: String
    let url: URL
}
extension ProductContent: Hashable {}
