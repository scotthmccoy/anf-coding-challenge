//
//  ExploreCardView.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

struct ExploreCardView: View {
    
    @StateObject var exploreCardViewModel = ExploreCardViewModel()
    
    var body : some View {
        ScrollView {
            if let errorMessage = exploreCardViewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                ForEach(exploreCardViewModel.products, id: \.self) { product in
                    ExploreCardCell(product: product)
                }
            }
        }
        .refreshable {
            exploreCardViewModel.refresh()
        }
        .onAppear {
            exploreCardViewModel.onAppear()
        }
    }
}

#Preview {
    ExploreCardView(
        exploreCardViewModel: ExploreCardViewModel(
            productsRepository: ProductsRepository(productsRepositoryDataProvider: ProductsRepositoryDataProvider(.mainBundleTestData)
            )
        )
    )
}
