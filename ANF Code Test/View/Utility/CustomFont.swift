//
//  Fonts.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

enum CustomFont: CaseIterable {
    case garamond
    case nhaasGroteskDsPro65Md
    case nHaasGroteskDSPro95Blk
    case tradeGothicLTPro
    case tradeGothicLTProBd2
    case tradeGothicLTStdExtended
    case tradeGothicLTStdBoldExt
    
    
    //"Garamond", "NHaasGroteskDSPro-95Blk", "NHaasGroteskDSPro-65Md", "TradeGothicLTPro", "TradeGothicLTPro-Bd2", "TradeGothicLTStd-Extended", "TradeGothicLTStd-BoldExt"
    
    var internalName: String {
        switch self {
            
            case .garamond:
                return "Garamond"
                
            case .nhaasGroteskDsPro65Md:
                return "NHaasGroteskDSPro-65Md"
                
            case .nHaasGroteskDSPro95Blk:
                return "NHaasGroteskDSPro-95Blk"
                
            case .tradeGothicLTPro:
                return "TradeGothicLTPro"
                
            case .tradeGothicLTProBd2:
                return "TradeGothicLTPro-Bd2"
                
            case .tradeGothicLTStdExtended:
                return "TradeGothicLTStd-Extended"
                
            case .tradeGothicLTStdBoldExt:
                return "TradeGothicLTStd-BoldExt"
                

        }
    }
    
    
    static func allFonts() -> [String] {        
        UIFont.familyNames.flatMap {
            UIFont.fontNames(forFamilyName: $0)
        }
    }
    
    static func likelyCustomFontNames() -> [String] {
        allFonts().filter {
            let lowercased = $0.lowercased()
            return lowercased.contains("trade") ||
            lowercased.contains("haas") ||
            lowercased.contains("gara")
        }
    }
}
