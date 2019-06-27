import XCTest
@testable import Validator

final class ValidatorTests: XCTestCase {
    
    func testFullname() {
        let validator = Validator()
        validator.add(name: "myName", value: "Soumen Bhuin", rules: [FullNameRule()])
        let (success, _, _) = validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testAlpha() {
        let validator = Validator()
        validator.add(name: "city", value: "Kolkata", rules: [.alpha])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testAlphaNumeric() {
        let validator = Validator()
        validator.add(name: "pan", value: "XLQCO9425A", rules: [.alphaNumeric])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testEmail() {
        let validator = Validator()
        validator.add(name: "email", value: "sbhuin@icloud.com", rules: [.required, .email])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testEnum() {
        let validator = Validator()
        validator.add(name: "gender", value: "male", rules: [.enum(["male","female"])])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    static var allTests = [
        ("fullName", testFullname),
        ("alpha", testAlpha),
        ("alphaNumeric", testAlphaNumeric),
        ("email", testEmail),
        ("enum", testEnum),
    ]
}
