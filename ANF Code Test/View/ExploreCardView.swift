//
//  ExploreCardView.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

struct ExploreCardView: View {
    
    @StateObject var exploreCardViewModel = ExploreCardViewModel()
    @State var loadingAnimationBegun = false
    
    var body : some View {
        mainview
        .background(Color.anfTan)
        .navigationBarTitle("Products", displayMode: .inline)
        
        // Nav Bar Text Color
        .toolbarColorScheme(.dark, for: .navigationBar)
        
        // Nav Bar Background color
        .toolbarBackground(
            .visible,
            for: .automatic
        )

        .onAppear {
            exploreCardViewModel.onAppear()
        }
    }
    
    @ViewBuilder
    var mainview: some View {
        if let errorMessage = exploreCardViewModel.errorMessage {
            show(errorMessage: errorMessage)
        } else if exploreCardViewModel.products.count > 0 {
            scrollView
        } else {
            loadingAnimation
        }
    }
    
    var scrollView: some View {
        ScrollView {
            ForEach(exploreCardViewModel.products, id: \.self) { product in
                ExploreCardCell(product: product)
            }
        }
        .background(Color.anfDarkGrey)
        .refreshable {
            exploreCardViewModel.refresh()
        }
    }
    
    func show(errorMessage: String) -> some View {
        VStack {
            Text("Network Error")
                .font(.largeTitle)
            Button("Try Again") {
                exploreCardViewModel.btnTryAgainTapped()
            }
            ScrollView {
                Text("Error message: \(errorMessage)")
                    .font(.footnote)
                    .padding(20)
            }
            .frame(maxHeight: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var loadingAnimation: some View {
        ProgressView() {
            Text("Finding you the perfect fit...")
                .apply(textStyling: .exploreCardCellTitle)
            
                // Fade in
                .opacity(loadingAnimationBegun ? 0 : 1)
                .animation(
                    // Animate for 1 second, reverse, and repeat
                    .easeInOut(
                        duration: 6
                    )
                    .repeatForever(
                        autoreverses: true
                    ),
                    value: loadingAnimationBegun
                )
                .onAppear {
                    loadingAnimationBegun = true
                }
        }
        .background(Color.anfTan)
        .progressViewStyle(.circular)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ExploreCardView(
        exploreCardViewModel: ExploreCardViewModel(
            productsRepository: ProductsRepository(productsRepositoryDataProvider: ProductsRepositoryDataProvider(.live)
            )
        )
    )
}
