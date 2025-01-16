//
//  ExplorCardCell.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

struct ExploreCardCell: View {
    
    let product: Product
    @State private var bottomDescriptionAttributedString: AttributedString?
    
    var body: some View {
        VStack {

            CachedAsyncImage(url: product.backgroundImageUrl) { phase in
                switch phase {
                    case .success(let image):
                        image.resizable()
                    default:
                        Image("Loading")
                            .resizable()
                }
            }
            .scaledToFill()
            .padding(.top, 10)
            
            Text(product.topDescription)
                .apply(textStyling: .exploreCardCellTopDescription)
                
            Text(product.title.uppercased())
                .apply(textStyling: .exploreCardCellTitle)

            Text(product.promoMessage)
                .apply(textStyling:  .exploreCardCellPromoMessage)

            if product.bottomDescription != "" {
                AttributedStringTextView(
                    html: product.bottomDescription,
                    color: .anfLightGrey,
                    font: .custom(CustomFont.garamond.internalName, size: 15)
                )
                .padding(10)
            }

            VStack {
                ForEach(product.productContents, id: \.self) { productContent in
                    ProductContentCell(productContent: productContent)
                }
            }
            .padding(10)
        }
        .background(Color.anfTan)
    }
}

#Preview {
    ScrollView {
        ExploreCardCell(product:
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
        )
    }
}
