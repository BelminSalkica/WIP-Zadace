//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Belmin Salkica on 8/25/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import XCTest
import UIKit

class FoodTrackerTests: XCTestCase {
    // MARK: FoodTracker Tests
    func testMealInitialization() {
        // Succes
        let item = Meal(name: "Janje", photo: nil, rating: 5)
        XCTAssertNotNil(item)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        // Bad rating
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
    }
}
