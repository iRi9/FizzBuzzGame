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
    
    func testStopGameWhenUserWrongInput() {
        let numberButton = app.buttons["numberButton"]
        
        numberButton.tap()
        numberButton.tap()
        numberButton.tap()
        
        XCTAssertEqual(numberButton.isEnabled, false, "When user lose any button can't tap")
    }
    
    func testPlayAgainButtonHiddenDefault() {
        let playAgainButton = app.buttons["playAgain"]
        
        XCTAssertEqual(playAgainButton.exists, false, "Play again button default is hidden")
    }
    
    func testPlayAgainButtonShowWhenUserWrongInput() {
        let playAgainButton = app.buttons["playAgain"]
        let fizzButton = app.buttons["fizzButton"]
        
        fizzButton.tap()
        
        XCTAssertEqual(playAgainButton.exists, true, "Show play again button when user mistake/lose")
    }
    

    func testPlayAgainButtonShowWhenUserWrongInput2() {
        let playAgainButton = app.buttons["playAgain"]
        let fizzButton = app.buttons["fizzButton"]
        
        playTo14()
        fizzButton.tap()
        
        XCTAssertEqual(playAgainButton.exists, true, "Show play again button when user mistake/lose")
    }
    
    func testTapPlayAgainButtonZeroScore() {
        let playAgainButton = app.buttons["playAgain"]
        let numberButton = app.buttons["numberButton"]
        
        numberButton.tap()
        numberButton.tap()
        numberButton.tap()
        
        playAgainButton.tap()
        
        let score = numberButton.label
        XCTAssertEqual(score, "0")
    }
    
    func testHidePlayAgainButtonWhenUserTappedPlayAgainButton() {
        let playAgainButton = app.buttons["playAgain"]
        let numberButton = app.buttons["numberButton"]
        
        numberButton.tap()
        numberButton.tap()
        numberButton.tap()
        
        playAgainButton.tap()
        
        XCTAssertEqual(playAgainButton.exists, false, "Play again button gone when user tapped it")
        
    }
    
    func testOnDefaultLoseLabelHidden() {
        let loseLabel = app.staticTexts["You lose"]
        XCTAssertEqual(loseLabel.exists, false, "The default lose label is hidden")
    }
    
    func testShowLoseLabelOnUserWrongInput() {
        let fizzButton = app.buttons["fizzButton"]
        let loseLabel = app.staticTexts["You lose"]
        
        fizzButton.tap()
        
        XCTAssertEqual(loseLabel.exists, true, "Show lose label when use input wrong")
    }
    
    func testHideLoseLabelWhenUserTapPlayAgain() {
        let fizzButton = app.buttons["fizzButton"]
        let playAgainButton = app.buttons["playAgain"]
        let loseLabel = app.staticTexts["You lose"]
        
        fizzButton.tap()
        playAgainButton.tap()
        
        XCTAssertEqual(loseLabel.exists, false, "Hide lose label when user play again")
        
    }
    
}
