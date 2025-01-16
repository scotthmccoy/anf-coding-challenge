//
//  Stubbable.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/16/25.
//

import Foundation
@testable import ANF_Code_Test


public protocol Stubbable {
    static var stub: Self {get}
}


extension Product: Stubbable {
    public static var stub: Self {
        Product(
            backgroundImageUrl: URL(string:  "https://img.abercrombie.com/is/image/anf/KIC_155-4713-00030-278_model6.jpg?policy=product-medium")!,
            topDescription: "A&F ESSENTIALS",
            title: "TOPS STARTING AT $12",
            promoMessage: "USE CODE: 12345",
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
    }
}

extension ProductDataObject: Stubbable {
    public static var stub: Self {
        ProductDataObject(
            title:   "TOPS STARTING AT $12",
            backgroundImage: "https://img.abercrombie.com/is/image/anf/KIC_155-4713-00030-278_model6.jpg?policy=product-medium",
            content: [
                ProductContentDataObject(
                    target: "https://www.abercrombie.com/shop/us/mens-new-arrivals",
                    title: "Shop Men",
                    elementType: nil
                    
                ),
                ProductContentDataObject(
                    target: "https://www.abercrombie.com/shop/us/womens-new-arrivals",
                    title: "Shop Women",
                    elementType: nil
                )
            ],
            promoMessage: "USE CODE: 12345",
            topDescription: "A&F ESSENTIALS",
            bottomDescription: "*In stores & online. <a href=\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160601_Shorts_US.html\">Exclusions apply. See Details</a>"
        )
    }
}

extension URL: Stubbable {
    public static var stub: Self {
        URL(string: "stub.com")!
    }
}

extension URLRequest: Stubbable {
    public static var stub: Self {
        URLRequest(url: URL.stub)
    }
}

extension HTTPURLResponse: Stubbable {
    public static var stub: Self {
        HTTPURLResponse(
            url: URL.stub,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )! as! Self
    }
}

extension Data: Stubbable {
    public static var stub: Self {
        "Foo".data(using: .utf8)!
    }
}
