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
            Image(product.backgroundImage)
        }
    }
}

#Preview {
    ExploreCardCell(product: Product(
            title: "Title",
            backgroundImage: "anf-US-20160415-app-women-jeans",
            content: [],
            promoMessage: "Promo Message",
            topDescription: "Top Desc",
            bottomDescription: "Bottom Desc"
        )
    )
}
