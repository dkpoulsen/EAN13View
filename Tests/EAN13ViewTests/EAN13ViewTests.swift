import XCTest
@testable import EAN13View

final class EAN13ViewTests: XCTestCase {
    
    func testValidatorValidEAN() {
        // Known valid EAN
        let validEAN = "5901234123457"
        XCTAssertNoThrow(try EAN13(value: validEAN))
    }
    
    func testValidatorInvalidEAN_WrongCheckDigit() {
        // Last digit changed from 7 to 8
        let invalidEAN = "5901234123458"
        XCTAssertThrowsError(try EAN13(value: invalidEAN)) { error in
            XCTAssertEqual(error as? EAN13.Error, EAN13.Error.invalidEAN)
        }
    }
    
    func testValidatorInvalidEAN_SwappedDigits() {
        // Swapped first two digits: 9501234123457
        // Previous buggy validator would accept this.
        let invalidEAN = "9501234123457"
        XCTAssertThrowsError(try EAN13(value: invalidEAN)) { error in
            XCTAssertEqual(error as? EAN13.Error, EAN13.Error.invalidEAN)
        }
    }
    
    func testGeneratorStructure() {
        let validEAN = "5901234123457"
        guard let ean = try? EAN13(value: validEAN) else {
            XCTFail("Should be valid EAN")
            return
        }
        
        // EAN13 total modules should be 95
        XCTAssertEqual(ean.lines.count, 95)
        
        // Start marker 101
        XCTAssertEqual(ean.lines[0], true)
        XCTAssertEqual(ean.lines[1], false)
        XCTAssertEqual(ean.lines[2], true)
        
        // End marker 101
        XCTAssertEqual(ean.lines[92], true)
        XCTAssertEqual(ean.lines[93], false)
        XCTAssertEqual(ean.lines[94], true)
    }

    static var allTests = [
        ("testValidatorValidEAN", testValidatorValidEAN),
        ("testValidatorInvalidEAN_WrongCheckDigit", testValidatorInvalidEAN_WrongCheckDigit),
        ("testValidatorInvalidEAN_SwappedDigits", testValidatorInvalidEAN_SwappedDigits),
        ("testGeneratorStructure", testGeneratorStructure),
    ]
}
