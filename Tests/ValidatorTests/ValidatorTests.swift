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
        validator.add(name: "email", value: "sbhuin@gmail.com", rules: [.required, .email])
        validator.add(name: "email1", value: "ABC67m@Gmail.com", rules: [.required, .email])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testEnum() {
        let validator = Validator()
        validator.add(name: "gender", value: "male", rules: [.enum(["male","female"])])
        validator.add(name: "genderNumber", value: 1, rules: [.enum([0,1,2])])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testYearExpiry() {
        let validator = Validator()
        validator.add(name: "CardYear", value: "2018", rules: [.yearExpiry(validity: 3)])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testMonth() {
        let validator = Validator()
        validator.add(name: "Month", value: "05", rules: [.month()])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testRange() {
        let validator = Validator()
        validator.add(name: "MonthNil", value: nil, rules: [.range(min:1, max:12)])
        validator.add(name: "Month", value: 4, rules: [.range(min:1, max:12)])
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
