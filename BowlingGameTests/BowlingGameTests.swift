import XCTest

class BowlingGame {
    private static let maxRolls = 21
    private var rolls = [Int](repeating: 0, count: maxRolls)
    private var currentRollIndex = 0
    
    func roll(pinsKnocked: Int) {
        rolls[currentRollIndex] = pinsKnocked
        currentRollIndex += 1
    }
    
    var score: Int {
        var score = 0
        var indexRoll = 0
        while indexRoll < 20 {
            if isSpare(on: indexRoll) {
                score += 10 + bonusSpare(on: indexRoll)
                indexRoll += 2
            } else {
                score += rolls[indexRoll]
                indexRoll += 1
            }
        }
        
        return score
    }
    
    private func bonusSpare(on indexRoll: Int) -> Int {
        return rolls[indexRoll + 2]
    }
    
    private func isSpare(on indexRoll: Int) -> Bool {
        return (rolls[indexRoll] + rolls[indexRoll+1]) == 10
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
    
    func test_roll_onSpare_shouldDeliverScoreWithSpareBonuses() {
        let samples = [
            (rolls: [1,9,0], expectedscore: 10),
            (rolls: [1,9,1], expectedscore: 12)
        ]
        samples.enumerated().forEach { (index, sample) in
            let sut = BowlingGame()
            
            sample.rolls.forEach { pins in
                sut.roll(pinsKnocked: pins)
            }
            roll(sut, times: 17, pins: 0)
            
            XCTAssertEqual(sut.score, sample.expectedscore, "for sample at index \(String(describing: index))")
        }
    }
    
    // MARK: - Helpers
    private func roll(_ sut: BowlingGame, times: Int, pins: Int) {
        Array<Int>.init(repeating: 0, count: times).forEach { roll in
            sut.roll(pinsKnocked: pins)
        }
    }
}
