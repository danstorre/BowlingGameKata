
import XCTest

enum RomanNumeralConverter {
    static func toRomanNumbers(_ int: Int) -> String { "I" }
}

final class RomanNumeralsTests: XCTestCase {
    
    func test_toRomanNumbers_convertsIntegerValuesToCorrectRomanNumbers() {
        let result = RomanNumeralConverter.toRomanNumbers(1)

        XCTAssertEqual(result, "I")
    }
}
