//
//  App.swift
//  ANF Code Test
//
//  Created by Scott McCoy on 1/13/25.
//

import SwiftUI

@main
struct ANFCodeTestApp: App {
    
    var isUnitTest = false
    
    init() {
        AppLog("Launching...")
        
        AppLog("Fonts: \(CustomFont.likelyCustomFontNames())")
        
        #if DEBUG
        
        let args = extractArgs()
        
        AppLog("Launch Args: \(args)")
        
        // Determine if Unit Tests are running. The UI will not display.
        isUnitTest = args.keys.contains("UNIT_TEST")
        
        // Override the API URL (used in UI Testing to set up different testing scenarios)
        if let overrideApiUrl = args["OVERRIDE_API_URL"] {
            ANFAPI.singleton.apiUrlString = overrideApiUrl
        }

        #endif
    }
    
    func extractArgs() -> [String: String] {
        var ret = [String: String]()
        for arg in ProcessInfo.processInfo.arguments {
            let tokens = arg.split(separator: "=")
            if let key = tokens.first, let value = tokens.last {
                ret[String(key)] = String(value)
            } else {
                ret[arg] = ""
            }
        }
        
        return ret
    }
    

    var body: some Scene {
        WindowGroup {
            if (!isUnitTest) {
                NavigationStack {
                    ExploreCardView()
                        .preferredColorScheme(.dark)
                }
            }
        }
    }
}
