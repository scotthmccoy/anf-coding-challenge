//
//  Color.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//
import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}


extension Color {
    
    static var anfTan: Self {
        Color(hex: 0xFFFFF7)
    }
    
    static var anfNavyGrey: Self {
        Color(hex: 0x50687b)
    }
    
    static var anfLightGrey: Self {
        Color(hex: 0x666666)
    }
    
    static var anfDarkGrey: Self {
        Color(hex: 0x253746)
    }
}
