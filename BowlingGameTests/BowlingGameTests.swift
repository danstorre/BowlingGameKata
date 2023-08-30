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
        rollMany(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        rollMany(pins: 1, times: 20)
        XCTAssertEqual(game.score(), 20)
    }
    
    // MARK: - helpers
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
}
