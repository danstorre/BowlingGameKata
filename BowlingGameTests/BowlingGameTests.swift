//
//  BowlingGameTests2.swift
//  BowlingGameTests
//
//  Created by Daniel Torres on 8/30/23.
//

import XCTest

final class Game {
    private var theScore = 0
    
    func roll(_ pins: Int) {
        theScore += pins
    }
    func score() -> Int {
        return theScore
    }
}

final class BowlingGameTests: XCTestCase {
    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testGutterGame() {
        for _ in 1...20 {
            game.roll(0)
        }
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        for _ in 1...20 {
            game.roll(1)
        }
        XCTAssertEqual(game.score(), 20)
    }
    
}
