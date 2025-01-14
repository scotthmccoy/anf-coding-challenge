//
//  ExplorCardCell.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

struct ExploreCardCell: View {
    
    let product: Product
    
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
            
            Text(product.topDescription)
                .font(.custom(CustomFont.garamond.internalName, size: 13))
                .foregroundStyle(.black)
            
            Text(product.title.uppercased())
                .font(.custom(CustomFont.tradeGothicLTProBd2.internalName, size: 17))
                .foregroundStyle(.black)

            
            Text(product.promoMessage)
                .font(.custom(CustomFont.tradeGothicLTPro.internalName, size: 17))
                .foregroundStyle(.black)
            
            Text(product.bottomDescription)
                .font(.custom(CustomFont.garamond.internalName, size: 17))
                .foregroundStyle(.gray)
                .padding(10)

            VStack {
                ForEach(product.productContents, id: \.self) { productContent in
                    ProductContentCell(productContent: productContent)
                }
            }
        }
        .background(Color("CellBackground"))
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
                bottomDescription: "*In stores & online. Exclusions apply. See Details",
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
