//
//  DataStructsTests.swift
//  ANF Code TestTests
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

import XCTest
import Scootys_Unit_Testing

@testable import ANF_Code_Test

class DataObjectsTests: XCTestCase {
    func test() {
        
        guard let jsonUrl = Bundle(for: Self.self)
        .url(forResource: "exploreData.json", withExtension: nil) else {
            XCTFail("Could not make url")
            return
        }
        
        guard let data = try? Data(contentsOf: jsonUrl) else {
            XCTFail("Could not get data")
            return
        }
        
        
        let result = CodableHelper().decode(
            type: [ProductDataObject].self,
            from: data
        )
        
        guard let productDataObjects = result.getSuccess() else {
            XCTFail("Could not get products: \(result)")
            return
        }
        
        let expected: [ProductDataObject] = [
            ProductDataObject(
                title: "TOPS STARTING AT $12",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-060624-M-HP-NewArrivals-USCA-Mens.jpg",
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
                bottomDescription: "*In stores & online. <a href=\\\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160602_Tier_Promo_US.html\\\">Exclusions apply. See Details</a>"
            )
                    
            ,
            ProductDataObject(
                title: "T-SHIRT DRESSES",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-053024-M-HP-YPB-USCA.jpg",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/womens-dresses-and-rompers",
                        title: "SHOP NOW",
                        elementType: "hyperlink"
                    )
                ],
                promoMessage: nil,
                topDescription: "THROW ON & GO",
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "Spotlight On New",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-060624-M-HP-NewArrivals-USCA-Womens.jpg",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/mens-new-arrivals",
                        title: "SHOP NOW",
                        elementType: "hyperlink"
                    )
                ],
                promoMessage: nil,
                topDescription: nil,
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "Spotlight On New",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-MAYWK4-SUMMER-OUTFITTING-SITE-CAT-PAGE-DESKTOP-W.png",
                content: nil,
                promoMessage: nil,
                topDescription: nil,
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "A&F ESSENTIALS",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-MAYWK4-YPB-SITE-DOUBLE-MIDLINE-WOMENS-AMERICANA.png",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/mens-a-and-f-essentials",
                        title: "SHOP NOW",
                        elementType: nil
                    )
                ],
                promoMessage: nil,
                topDescription: "THE SOFTEST STYLE STAPLES",
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "FASHION TOPS",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/ANF-2024-MAYWK4-YPB-SITE-DOUBLE-MIDLINE-MENS.png",
                content: nil,
                promoMessage: nil,
                topDescription: "SUMMER-READY",
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "ALL SHORTS $29",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/KIC_149-4069-0034-278_model6.jpg?policy=product-medium",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/womens-shorts-bottoms",
                        title: "SHOP NOW",
                        elementType: nil
                    )
                ],
                promoMessage: nil,
                topDescription: "LIMITED TIME",
                bottomDescription: "*In stores & online. <a href=\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160601_Shorts_US.html\">Exclusions apply. See Details</a>"
            ),
            ProductDataObject(
                title: "ALL SHORTS $29",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/KIC_128-4007-0070-412_prod1.jpg?policy=product-medium",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/mens-shorts-bottoms",
                        title: "SHOP NOW",
                        elementType: nil
                    )
                ],
                promoMessage: nil,
                topDescription: "LIMITED TIME",
                bottomDescription: "*In stores & online. <a href=\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160601_Shorts_US.html\">Exclusions apply. See Details</a>"
            ),
            ProductDataObject(
                title: "TEES & HENLEYS",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/KIC_125-4003-0054-100_model1?policy=product-medium",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/mens-tees-and-henleys-tops",
                        title: "SHOP NOW",
                        elementType: nil
                    )
                ],
                promoMessage: nil,
                topDescription: "SUMMER STAPLE",
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "ALL JEANS BUY ONE GET ONE 50% OFF",
                backgroundImage: "http://img.abercrombie.com/is/image/anf/KIC_155-4713-00030-278_model6.jpg?policy=product-medium",
                content: [
                    ProductContentDataObject(
                        target: "https://www.abercrombie.com/shop/us/womens-jeans-bottoms",
                        title: "SHOP NOW",
                        elementType: nil
                    )
                ],
                promoMessage: nil,
                topDescription: "LIMITED TIME",
                bottomDescription: "*In stores & online. Applies to equal or lesser value item. Single items priced as marked. <a href=\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160601_Jeans_BOGO_50_Off.html\">Exclusions apply. See Details</a>"
            )
        ]
        
        XCTAssertEqualEncodable(
            expected: expected,
            actual: productDataObjects
        )
        
    }
    
}
