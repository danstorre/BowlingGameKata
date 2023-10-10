import XCTest

class BowlingGame {
    private(set) var score = 0
    
    func roll(pins: Int) {
        score += pins
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
