//
//  DataStructs.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

struct ProductDataObject {
    let title: String?
    let backgroundImage: String?
    let content: [ContentDataObject]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
}
extension ProductDataObject: Codable, Equatable {}

struct ContentDataObject: Codable, Equatable {
    let target: String
    let title: String
    let elementType: String?
}
