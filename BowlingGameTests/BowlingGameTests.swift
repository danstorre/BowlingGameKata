import XCTest

final class Game {
    private var theScore = 0
    func roll(_ pins: Int) {
        theScore += pins
    }
    
    func score() -> Int {
        return theScore
    }
}

final class BowlingGameTests: XCTestCase {
    func testGutterGame() {
        let game = Game()
        for _ in 1...20 {
            game.roll(0)
        }
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOnes() {
        let game = Game()
        for _ in 1...20 {
            game.roll(1)
        }
        XCTAssertEqual(game.score(), 20)
    }
}
