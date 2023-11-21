import XCTest

class BowlingGame {
    private var rolls: [Int] = .init(repeating: 0, count: 21)
    private var currentRollIndex = 0
    
    func roll(pins: Int) {
        rolls[currentRollIndex] = pins
        currentRollIndex += 1
    }
    
    func score() -> Int {
        var accumulatedScore = 0
        let frames = (1...10)
        var rollIndex = 0
        for _ in frames {
            if isStrike(rollIndex) {
                accumulatedScore += partialStrikeResult(rollIndex) + strikeBonus(rollIndex)
                rollIndex += 1
            } else if isSpare(rollIndex) {
                accumulatedScore += partialFrameResult(rollIndex: rollIndex)
                accumulatedScore += spareBonus(for: rollIndex)
                rollIndex += 2
            } else {
                accumulatedScore += partialFrameResult(rollIndex: rollIndex)
                rollIndex += 2
            }
        }
        return accumulatedScore
    }
    
    private func partialStrikeResult(_ rollIndex: Int) -> Int {
        rolls[rollIndex]
    }
    
    private func strikeBonus(_ rollIndex: Int) -> Int {
        rolls[rollIndex + 1] + rolls[rollIndex + 2]
    }
    
    private func isStrike(_ rollIndex: Int) -> Bool {
        rolls[rollIndex] == 10
    }
    
    private func partialFrameResult(rollIndex: Int) -> Int {
        rolls[rollIndex] + rolls[rollIndex + 1]
    }
    
    private func isSpare(_ rollIndex: Int) -> Bool {
        rolls[rollIndex] + rolls[rollIndex + 1] == 10
    }
    
    private func spareBonus(for rollIndex: Int) -> Int {
        rolls[rollIndex + 2]
    }
}

final class BowlingGameTests: XCTestCase {
    
    func test_GutterGame_returnsScoreOfZero() {
        let sut = BowlingGame()
        
        rollUntilEndOfGame(sut: sut, pins: 0)
        
        XCTAssertEqual(sut.score(), 0)
    }
    
    func test_GameOfOnes_returnsScoreOfTwenty() {
        let sut = BowlingGame()
        
        rollUntilEndOfGame(sut: sut, pins: 1)
        
        XCTAssertEqual(sut.score(), 20)
    }
    
    func test_OneSpare_returnsScoreWithSpareBonus() {
        let sut = BowlingGame()
        
        rollSpare(sut: sut)
        sut.roll(pins: 5)
        roll(sut: sut, manyRolls: 17, withPins: 0)
        
        XCTAssertEqual(sut.score(), 20)
    }
    
    func test_OneStrike_returnsScoreWithStrikeBonus() {
        let sut = BowlingGame()
        
        rollStrike(sut: sut)
        sut.roll(pins: 5)
        sut.roll(pins: 4)
        roll(sut: sut, manyRolls: 16, withPins: 0)
        
        XCTAssertEqual(sut.score(), 28)
    }
    
    func test_PerfectGame_returnsMaximumScore() {
        let sut = BowlingGame()
        
        roll(sut: sut, manyRolls: 12, withPins: 10)
        
        XCTAssertEqual(sut.score(), 300)
    }
    
    // MARK: Helpers
    private func rollStrike(sut: BowlingGame) {
        sut.roll(pins: 10)
    }
    
    private func rollUntilEndOfGame(sut: BowlingGame, pins: Int) {
        roll(sut: sut, manyRolls: 20, withPins: pins)
    }
    
    private func roll(sut: BowlingGame, manyRolls rolls: Int, withPins pins: Int) {
        (1...rolls).forEach { _ in
            sut.roll(pins: pins)
        }
    }
    
    private func rollSpare(sut: BowlingGame) {
        sut.roll(pins: 4)
        sut.roll(pins: 6)
    }
}
