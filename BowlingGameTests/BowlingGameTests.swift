import XCTest

final class Game {
    func roll(_ pins: Int) {
    }
    
    func score() -> Int {
        return 0
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
}
