//
//  AttributedString.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/15/25.
//
import Foundation
import SwiftUI

extension AttributedString {
    
    @MainActor
    init(html: String, linkColor: Color) {
        guard let data = html.data(using: .utf8) else {
            self = AttributedString("Failed to load HTML data.")
            return
        }
        
        do {
            let nsAttrString = try NSMutableAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
            
            // Convert to SwiftUI AttributedString
            self = AttributedString(nsAttrString)
        } catch {
            self = AttributedString("Error parsing HTML: \(error)")
        }
    }
}
