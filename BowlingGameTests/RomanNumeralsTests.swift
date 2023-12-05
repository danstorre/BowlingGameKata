
import XCTest

enum RomanNumeralConverter {
    static func toRomanNumbers(_ int: Int) -> String { "I" }
}

final class RomanNumeralsTests: XCTestCase {
    
    func test_toRomanNumbers_convertsIntegerValuesToCorrectRomanNumbers() {
        let samples: [(input: Int, expected: String)] = [
            (1, "I")
        ]
        
        for sample in samples {
            let result = RomanNumeralConverter.toRomanNumbers(sample.input)
            XCTAssertTrue(result == sample.expected, "Expected \(sample.expected) for input \(sample.input), got \(result) instead")
        }
    }
}
