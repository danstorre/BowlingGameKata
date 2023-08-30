import XCTest

class BowlingGame {
    let score: Int = 0
}

final class BowlingGameTests: XCTestCase {
    func test_score_shouldDeliverZero() {
        let sut = BowlingGame()
        XCTAssertEqual(sut.score, 0)
    }
}
