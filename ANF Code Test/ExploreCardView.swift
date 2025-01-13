//
//  ExploreCardView.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

struct ExploreCardView: View {
    
    var exploreData: [[AnyHashable: Any]]? {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
         let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)),
         let jsonDictionary = try? JSONSerialization.jsonObject(with: fileContent, options: .mutableContainers) as? [[AnyHashable: Any]] {
            return jsonDictionary
        }
        return nil
    }
    
    var body : some View {
        ScrollView {
            
            
        }
    }
}
