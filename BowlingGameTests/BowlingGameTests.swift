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
            accumulatedScore += rolls[rollIndex] + rolls[rollIndex + 1]
            
            if isSpare(rollIndex) {
                accumulatedScore += rolls[rollIndex + 2]
            }
            
            rollIndex += 2
        }
        return accumulatedScore
    }
    
    private func isSpare(_ rollIndex: Int) -> Bool {
        rolls[rollIndex] + rolls[rollIndex + 1] == 10
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
    
    // MARK: Helpers
    
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
