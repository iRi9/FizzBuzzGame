//
//  ViewControllerUITests.swift
//  FizzBuzzUITests
//
//  Created by ebdesk-066 on 30/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testTapNumberButtonIncrementsScore() {
        let numberButton = app.buttons["numberButton"]
        numberButton.tap()
        let newScore = numberButton.label
        XCTAssertEqual(newScore, "1")
    }
    
    func testTapNumberButtonDoubleIncrementsScore() {
        let numberButton = app.buttons["numberButton"]
        
        numberButton.tap()
        numberButton.tap()
        
        let newScore = numberButton.label
        XCTAssertEqual(newScore, "2")
    }
    
    func testTapFizzButtonIncrementsScoreTo3() {
        let numberButton = app.buttons["numberButton"]
        let fizzButton = app.buttons["fizzButton"]
        
        numberButton.tap()
        numberButton.tap()
        fizzButton.tap()
        
        let newScore = numberButton.label
        XCTAssertEqual(newScore, "3")
    }
    
    func testTapBuzzButtonIncrementsScoreTo5() {
        let numberButton = app.buttons["numberButton"]
        let buzzButton = app.buttons["buzzButton"]
        let fizzButton = app.buttons["fizzButton"]
        
        numberButton.tap()
        numberButton.tap()
        fizzButton.tap()
        numberButton.tap()
        buzzButton.tap()
        
        let newScore = numberButton.label
        XCTAssertEqual(newScore, "5")
    }
    
    // Helper function for fizzBuzz test
    func playTo14() {
        let numberButton = app.buttons["numberButton"]
        let buzzButton = app.buttons["buzzButton"]
        let fizzButton = app.buttons["fizzButton"]
        
        numberButton.tap()
        numberButton.tap()
        fizzButton.tap()
        numberButton.tap()
        buzzButton.tap()
        fizzButton.tap()
        numberButton.tap()
        numberButton.tap()
        fizzButton.tap()
        buzzButton.tap()
        numberButton.tap()
        fizzButton.tap()
        numberButton.tap()
        numberButton.tap()
    }
    
    func testTapFizzBuzzButtonIncrementsScoreTo15() {
        let numberButton = app.buttons["numberButton"]
        let fizzBuzzButton = app.buttons["fizzBuzzButton"]
    
        playTo14()
        
        fizzBuzzButton.tap()
        
        let newScore = numberButton.label
        XCTAssertEqual(newScore, "15")
    }

}
