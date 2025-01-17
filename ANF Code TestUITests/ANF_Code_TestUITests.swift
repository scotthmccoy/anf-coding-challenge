//
//  ANF_Code_TestUITests.swift
//  ANF Code TestUITests
//
//  Created by Scott McCoy on 1/16/25.
//

import XCTest
import Scootys_UI_Testing

final class AppLoadTest: XCTestCase {
    
    @MainActor
    func test() {
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launch()
        
        let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        
        app.staticTexts["A&F ESSENTIALS"].assertExists()
        
        app.buttons.tap(label: "Shop Men")
        safari.assertHittable()
        app.activate()
        
        app.buttons.tap(label: "Shop Women")
        safari.assertHittable()
        app.activate()
    }
}
 
final class AppFailToLoadTest: XCTestCase {
    
    @MainActor
    func test() {
        let app = XCUIApplication()
        app.launchArguments = ["OVERRIDE_API_URL=BAD.COM"]
        app.launch()
        
        app.staticTexts["A&F ESSENTIALS"].assertNotExists()
        
        WaitFor.tryThrows {
            guard app.debugDescriptionProxies.contains(where: {
                $0.label?.contains("unsupported URL") ?? false
            }) else {
                throw TestingError("Error message not found")
            }
        }
        
        app.scrollViews.firstMatch.pullToRefresh()
        
        app.staticTexts["A&F ESSENTIALS"].assertNotExists()

    }
}
