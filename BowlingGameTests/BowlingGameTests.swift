import XCTest

class BowlingGame {
    var score: Int {
        return rolls.reduce(0) { partialScore, nextNockedPins in
            partialScore + nextNockedPins
        }
    }
    
    private var rolls = [Int](repeating: 0, count: 20)
    private var curentRollIndex = 0
    
    func roll(pinsKnocked: Int) {
        rolls[curentRollIndex] = pinsKnocked
        curentRollIndex += 1
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
