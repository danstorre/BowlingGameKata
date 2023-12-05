
import XCTest

enum RomanNumeralConverter {
    static func toRomanNumbers(_ int: Int) -> String { "I" }
}

final class RomanNumeralsTests: XCTestCase {
    
    func test_delivers_I_for_1() {
        let result = RomanNumeralConverter.toRomanNumbers(1)

        XCTAssertEqual(result, "I")
    }
}
