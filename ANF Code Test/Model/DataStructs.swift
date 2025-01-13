//
//  DataStructs.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

struct ProductDataObject: Codable {
    let title: String?
    let backgroundImage: String?
    let content: [ContentDataObject]?
    let promoMessage: String?
    let topDescription: String?
    let bottomDescription: String?
}

struct ContentDataObject: Codable {
    let target: String
    let title: String
    let elementType: String?
}
