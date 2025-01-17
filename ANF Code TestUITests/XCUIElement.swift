//
//  XCUIElement.swift
//  ANF Code TestUITests
//
//  Created by Scott McCoy on 1/16/25.
//

import Foundation
import XCTest

extension XCUIElement {
    
    func pullToRefresh() {
        
        let startPosition = CGPointMake(200, 100)
        let endPosition = CGPointMake(200, 400)
        let start = self.coordinate(withNormalizedOffset: CGVectorMake(0, 0)).withOffset(CGVector(dx: startPosition.x, dy: startPosition.y))
        let finish = self.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).withOffset(CGVector(dx: endPosition.x, dy: endPosition.y))
        start.press(forDuration: 0, thenDragTo: finish)
        
    }
}
