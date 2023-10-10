import XCTest

class BowlingGame {
    let score = 0
    
    func roll(pins: Int) {
        
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
}
