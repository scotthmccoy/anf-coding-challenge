//
//  Fonts.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

// List of custom fonts added to the application
// Exposes allFonts and likelyCustomFontNames to help find their internal names at app launch

enum CustomFont: CaseIterable {
    /// Serifed, elegant
    case garamond
    
    /// Sans, Callout, bold
    case nhaasGroteskDsPro65Md
    
    /// Sans, Callout, black (extra-bold)
    case nHaasGroteskDSPro95Blk
    
    /// Sans, thin
    case tradeGothicLTPro
    
    /// Sans, bold
    case tradeGothicLTProBd2
    
    /// Sans, wide
    case tradeGothicLTStdExtended
    
    /// Sans, wide, bold
    case tradeGothicLTStdBoldExt
    
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
