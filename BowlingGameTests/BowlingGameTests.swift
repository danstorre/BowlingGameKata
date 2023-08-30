import XCTest

class BowlingGame {
    private(set) var score: Int = 0
    
    func roll(pinsKnocked: Int) {
        score += pinsKnocked
    }
}

final class BowlingGameTests: XCTestCase {
    func test_score_shouldDeliverScoreOfZero() {
        let sut = BowlingGame()
        XCTAssertEqual(sut.score, 0)
    }
    
    func test_roll_onGutterGame_shouldDeliverScoreOfZero() {
        let sut = BowlingGame()
        
        Array<Int>.init(repeating: 0, count: 20).forEach { roll in
            sut.roll(pinsKnocked: 0)
        }
        
        XCTAssertEqual(sut.score, 0)
    }
    
    func test_roll_onOnePinPerFrame_shouldDeliverScoreOfTen() {
        let sut = BowlingGame()
        
        Array<Int>.init(repeating: 0, count: 10).forEach { roll in
            sut.roll(pinsKnocked: 1)
            sut.roll(pinsKnocked: 0)
        }
        
        XCTAssertEqual(sut.score, 10)
    }
}
