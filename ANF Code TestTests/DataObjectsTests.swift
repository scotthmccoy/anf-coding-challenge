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
                backgroundImage: "anf-20160527-app-m-shirts.jpg",
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
                backgroundImage: "anf-US-20160601-app-women-dresses.jpg",
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
                backgroundImage: "anf-US-20160601-app-men-spotlight.jpg",
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
                backgroundImage: "anf-US-20160601-app-women-spotlight.jpg",
                content: nil,
                promoMessage: nil,
                topDescription: nil,
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "A&F ESSENTIALS",
                backgroundImage: "anf-US-20160415-app-men-essentials.jpg",
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
                backgroundImage: "anf-US-20160518-app-women-tops.jpg",
                content: nil,
                promoMessage: nil,
                topDescription: "SUMMER-READY",
                bottomDescription: nil
            ),
            ProductDataObject(
                title: "ALL SHORTS $29",
                backgroundImage: "anf-US-20160505-app-w-shorts.jpg",
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
                backgroundImage: "anf-US-20160519-app-m-shorts.jpg",
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
                backgroundImage: "anf-US-20160518-app-men-tees.jpg",
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
                backgroundImage: "anf-US-20160415-app-women-jeans.jpg",
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
