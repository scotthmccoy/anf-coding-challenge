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
            Text(product.title)
            CachedAsyncImage(url: product.backgroundImageUrl)
        }
    }
}

#Preview {
    ExploreCardCell(product: Product(
            title: "Title",
            backgroundImageUrl: URL(string:  "https://img.abercrombie.com/is/image/anf/KIC_155-4713-00030-278_model6.jpg?policy=product-medium")!,
            content: [],
            promoMessage: "Promo Message",
            topDescription: "Top Desc",
            bottomDescription: "Bottom Desc"
        )
    )
}
