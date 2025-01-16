//
//  AttributedTextView.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//
import SwiftUI

struct AttributedStringTextView: View {
    var html: String
    var color: Color
    var font: Font
    
    @State private var attributedString: AttributedString?
    
    var body : some View {
        VStack {
            if let attributedString {
                Text(attributedString)
            }
        }
        .onAppear() {
            // NOTE: Attributed Strings must be created on the main Queue.
            DispatchQueue.main.async {
                var attributedString = AttributedString(
                    html: html,
                    linkColor: .blue
                )
                attributedString.font = font
                attributedString.foregroundColor = color
                self.attributedString = attributedString
            }
        }
        
    }
}
