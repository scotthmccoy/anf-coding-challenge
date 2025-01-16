//
//  FontTestView.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import Foundation

import SwiftUI

struct FontTestView: View {

    var body: some View {
        ForEach(CustomFont.allCases, id: \.self) { customFont in
            Text("\(customFont.internalName)")
                .font(
                    .custom(customFont.internalName, size: 20)
                )
        }
    }
}

#Preview {
    FontTestView()
}
