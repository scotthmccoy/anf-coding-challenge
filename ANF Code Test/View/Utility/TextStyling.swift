//
//  TextStyling.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//

import Foundation
import SwiftUI

enum TextStyling {
    case exploreCardCellTopDescription
    case exploreCardCellTitle
    case exploreCardCellPromoMessage
    case exploreCardCellBottomDescription
    case productContentsButton
}

extension Text {
    
    @ViewBuilder
    func apply(textStyling: TextStyling) -> some View {
        switch textStyling {
            case .exploreCardCellTopDescription:
                self
                .font(
                    .custom(
                        CustomFont.garamond.internalName,
                        size: 13
                    )
                )
                .foregroundColor(.anfDarkGrey)
                
            case .exploreCardCellTitle:
                self
                .font(
                    .custom(
                        CustomFont.tradeGothicLTProBd2.internalName,
                        size: 17
                    )
                )
                .foregroundColor(.anfDarkGrey)
                .kerning(1.5)
                .scaleEffect(x: 1, y: 1.2)
                
            case .exploreCardCellPromoMessage:
                self
                .font(
                    .custom(
                        CustomFont.tradeGothicLTPro.internalName,
                        size: 11
                    )
                )
                .foregroundColor(.anfDarkGrey)
                
            case .exploreCardCellBottomDescription:
                self
                .font(
                    .custom(
                        CustomFont.garamond.internalName,
                        size: 13
                    )
                )
                .foregroundColor(.anfLightGrey)
                
            case .productContentsButton:
                self
                .font(
                    .custom(
                        CustomFont.tradeGothicLTProBd2
                        .internalName, size: 15
                    )
                )
                .foregroundColor(.anfNavyGrey)
                .kerning(3.0)
        }
    }
}




