import XCTest

class BowlingGame {
    private var rolls: [Int] = .init(repeating: 0, count: 21)
    private var currentRollIndex = 0
    
    func roll(pins: Int) {
        rolls[currentRollIndex] = pins
        currentRollIndex += 1
    }
    
    func score() -> Int {
        var score = 0
        let frames = (1...10)
        var rollIndex = 0
        for _ in frames {
            score += rolls[rollIndex] + rolls[rollIndex + 1]
            
            if rolls[rollIndex] + rolls[rollIndex + 1] == 10 {
                score += rolls[rollIndex + 2]
            }
            
            rollIndex += 2
        }
        return score
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
        let frames = (0..<10)
        
        frames.forEach { _ in
            sut.roll(pins: 1)
            sut.roll(pins: 1)
        }
        
        XCTAssertEqual(sut.score(), 20)
    }
    
    func test_OneSpare_returnsScoreWithSpareBonus() {
        let sut = BowlingGame()
        
        // Roll a spare
        sut.roll(pins: 4)
        sut.roll(pins: 6)

        sut.roll(pins: 5)
        sut.roll(pins: 0)
        
        let frames = (1...8)
        
        frames.forEach { _ in
            sut.roll(pins: 0)
            sut.roll(pins: 0)
        }
        
        XCTAssertEqual(sut.score(), 20)
    }
    
    // MARK: Helpers
    
    private func rollUntilEndOfGame(sut: BowlingGame, pins: Int) {
        let frames = (0..<10)
                
        frames.forEach { _ in
            sut.roll(pins: pins)
            sut.roll(pins: pins)
        }
    }
}
