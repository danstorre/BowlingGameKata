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
        let maxRolls = 20
        
        roll(sut, times: maxRolls, pins: 0)
        
        XCTAssertEqual(sut.score, 0)
    }
    
    func test_roll_onOnePinPerRoll_shouldDeliverScoreOfTwenty() {
        let sut = BowlingGame()
        let maxRolls = 20
        
        roll(sut, times: maxRolls, pins: 1)
        
        XCTAssertEqual(sut.score, 20)
    }
    
    // MARK: - Helpers
    private func roll(_ sut: BowlingGame, times: Int, pins: Int) {
        Array<Int>.init(repeating: 0, count: times).forEach { roll in
            sut.roll(pinsKnocked: pins)
        }
    }
}
