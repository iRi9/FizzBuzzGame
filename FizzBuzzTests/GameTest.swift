//
//  GameTest.swift
//  FizzBuzzTests
//
//  Created by ebdesk-066 on 17/06/19.
//  Copyright © 2019 irig.com. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class GameTest: XCTestCase {
    
    let game = Game()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGameStartAtZero() {
        XCTAssertTrue(game.score == 0)
    }
    
    func testOnPlayScoreIncremented() {
        _ = game.play(move: .number)
        XCTAssertTrue(game.score == 1)
    }
    
    func testOnPlayTwiceScoreIncremented() {
        _ = game.play(move: .number)
        _ = game.play(move: .number)
        XCTAssertEqual(game.score, 2)
    }
    
    func testIfMoveIsRight() {
        game.score = 2
        let result = game.play(move: .fizz)
        XCTAssertEqual(result.right, true)
    }
    
    func testIfMoveIsWrong() {
        game.score = 1
        let result = game.play(move: .fizz)
        XCTAssertEqual(result.right, false)
    }
    
    func testIfBuzzMoveIsRight() {
        game.score = 4
        let result = game.play(move: .buzz)
        XCTAssertEqual(result.right, true)
    }
    
    func testIfBuzzMoveIsWrong() {
        game.score = 5
        let result = game.play(move: .buzz)
        XCTAssertEqual(result.right, false)
    }
    
    func testIfFizzBuzzMoveIsRight() {
        game.score = 14
        let result = game.play(move: .fizzBuzz)
        XCTAssertEqual(result.right, true)
    }
    
    func testIfFizzBuzzMoveIsWrong() {
        game.score = 15
        let result = game.play(move: .fizzBuzz)
        XCTAssertEqual(result.right, false)
    }
    
    func testIfNumberMoveIsRight() {
        game.score = 12
        let result = game.play(move: .number)
        XCTAssertEqual(result.right, true)
    }
    
    func testIfNumberMoveIsWrong() {
        game.score = 11
        let result = game.play(move: .number)
        XCTAssertEqual(result.right, false)
    }
    
    func testIfMoveWrongScoreNotIncremented() {
        game.score = 1
        _ = game.play(move: .fizz)
        XCTAssertEqual(game.score, 1)
    }
    
    func testPlayShouldReturnIfMoveRight() {
        let response = game.play(move: .number)
        XCTAssertNotNil(response.right)
    }
    
    func testPlayShouldReturnNewScore() {
        let response = game.play(move: .number)
        XCTAssertNotNil(response.score)
    }

}
