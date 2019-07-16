import XCTest
@testable import Validator

final class ValidatorTests: XCTestCase {
    
    func testRequired() {
        let validator = Validator()
        validator.add(name: "required", value: "asdf", rules: [.required])
        validator.add(name: "required2", value: ["a","b"], rules: [.required])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
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
        validator.add(name: "Month", value: 3, rules: [.range(min:1, max:12)])
        let (success, validatable, error) = validator.validate()
        if let v = validatable?.description, let e = error?.description {
            debugPrint("Range Error: " + v + " " + e)
        }
        XCTAssertEqual(success, true)
    }
    
    func testExactLength() {
        let validator = Validator()
        validator.add(name: "Month", value: "JAN", rules: [.exactLength(3)])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testConfirm() {
        let validator = Validator()
        validator.add(name: "Password", value: "Pass1234", rules: [.confirm("Pass1234")])
        validator.add(name: "Gender", value: 1, rules: [.confirm(1)])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testLength() {
        let validator = Validator()
        validator.add(name: "Password", value: "Pass1234", rules: [.length(min: 5, max: 16)])
        validator.add(name: "Notes", value: [10, 20, 50, 100, 200, 500, 1000, 2000], rules: [.arrayLength(min: 5, max: 16)])
        validator.add(name: "Days", value: ["Sun", "Mon", "Tue"], rules: [.arrayLength(min: 1, max: 7)])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    func testCoordinate() {
        let validator = Validator()
        validator.add(name: "LatLong", value: [88.3639, 22.5726], rules: [.coordinate])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
    }
    
    static var allTests = [
        ("FullName", testFullname),
        ("Alpha", testAlpha),
        ("AlphaNumeric", testAlphaNumeric),
        ("Email", testEmail),
        ("Enum", testEnum),
        ("YearExpiry", testYearExpiry),
        ("Month", testMonth),
        ("Range", testRange),
        ("ExactLength", testExactLength),
        ("Confirm", testConfirm),
        ("Length", testLength),
        ("GPSCoordinate", testCoordinate),
    ]
}
