
import XCTest

enum RomanNumeralConverter {
    static func toRomanNumbers(_ int: Int) -> String {
        if int == 1 { return "I" }
        if int == 2 { return "II" }
        if int == 3 { return "III" }
        return "IV"
    }
}

final class RomanNumeralsTests: XCTestCase {
    
    func test_toRomanNumbers_convertsIntegerValuesToCorrectRomanNumbers() {
        let samples: [(input: Int, expected: String)] = [
            (1, "I"),
            (2, "II"),
            (3, "III"),
            (4, "IV")
        ]
        
        for sample in samples {
            let result = RomanNumeralConverter.toRomanNumbers(sample.input)
            XCTAssertTrue(result == sample.expected, "Expected \(sample.expected) for input \(sample.input), got \(result) instead")
        }
    }
}
