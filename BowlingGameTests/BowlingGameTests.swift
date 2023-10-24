import XCTest

class BowlingGame {
    private var rolls: [Int] = .init(repeating: 0, count: 21)
    var score: Int {
        calculateScore()
    }
    private var currentRollIndex = 0
    
    func roll(pins: Int) {
        rolls[currentRollIndex] = pins
        currentRollIndex += 1
    }
    
    func calculateScore() -> Int {
        var score = 0
        let frames = (1...10)
        for index in frames {
            score += rolls[index] + rolls[index + 1]
        }
        return score
    }
}

final class BowlingGameTests: XCTestCase {
    func test_GutterGame_returnsScoreOfZero() {
        let sut = BowlingGame()
        let frames = (0..<10)
        
        frames.forEach { _ in
            sut.roll(pins: 0)
            sut.roll(pins: 0)
        }
        
        XCTAssertEqual(sut.score, 0)
    }
    
    func test_GameOfOnes_returnsScoreOfTwenty() {
        let sut = BowlingGame()
        let frames = (0..<10)
        
        frames.forEach { _ in
            sut.roll(pins: 1)
            sut.roll(pins: 1)
        }
        
        XCTAssertEqual(sut.score, 20)
    }
}
