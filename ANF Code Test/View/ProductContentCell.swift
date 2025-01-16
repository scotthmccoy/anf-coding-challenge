//
//  ProductContentCell.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation


import SwiftUI

struct ProductContentCell: View {
    
    let productContent: ProductContent
    
    var body : some View {
        Button(
            action: {
                UIApplication.shared.open(productContent.url)
            }, label: {
                Text(productContent.title)
                    .apply(textStyling: TextStyling.productContentsButton)
                
            }
        )
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
        .padding(.bottom, 10)
        .border(Color.anfLightGrey, width: 3)
    }
}


#Preview {
    ProductContentCell(
        productContent: ProductContent(
            title: "Shop Men",
            url: URL(string: "foo.com")!
        )
    )
}
