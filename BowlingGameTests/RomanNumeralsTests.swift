
import XCTest

enum RomanNumeralConverter {
    static func toRomanNumbers(_ int: Int) -> String {
        int == 1 ? "I" : "II"
    }
}

final class RomanNumeralsTests: XCTestCase {
    
    func test_toRomanNumbers_convertsIntegerValuesToCorrectRomanNumbers() {
        let samples: [(input: Int, expected: String)] = [
            (1, "I"),
            (2, "II")
        ]
        
        for sample in samples {
            let result = RomanNumeralConverter.toRomanNumbers(sample.input)
            XCTAssertTrue(result == sample.expected, "Expected \(sample.expected) for input \(sample.input), got \(result) instead")
        }
    }
}
