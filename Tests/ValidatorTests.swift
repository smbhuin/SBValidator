import XCTest
@testable import SBValidator

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
        let validEmails = ["email@domain.com","firstname.lastname@domain.com","email@subdomain.domain.com","firstname+lastname@domain.com","1234567890@domain.com","email@domain-one.com","_______@domain.com","email@domain.name","email@domain.co.jp","firstname-lastname@domain.com",]
        for (i, v) in validEmails.enumerated() {
            validator.add(name: "email\(i)", value: v, rules: [.email])
        }
        let (success, _, error) = validator.validate()
        if let e = error {
            debugPrint(e.description)
        }
        XCTAssertEqual(success, true)
        
        let nvalidator = Validator()
        let invalidEmails = ["email@domain.com email@domain.com",
        "plainaddress",
        "#@%^%#$@#$@#.com",
        "@domain.com",
        "Joe Smith <email@domain.com>",
        "email.domain.com",
        "email@domain@domain.com",
        //".email@domain.com",
        //"email.@domain.com",
        //"email..email@domain.com",
        "あいうえお@domain.com",
        "email@domain.com (Joe Smith)",
        "email@domain",
        //"email@-domain.com",
        //"email@domain..com",
        "email@[123.123.123.123]",
        "\"email\"@domain.com"]
        for (i, v) in invalidEmails.enumerated() {
            nvalidator.add(name: "email\(i)", value: v, rules: [.email])
        }
        let nsuccess = nvalidator.validateAll()
        if nsuccess.count != invalidEmails.count {
            for (_, e) in nsuccess {
                debugPrint(e.description)
            }
        }
        
        XCTAssertEqual(nsuccess.count == invalidEmails.count, true)
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
        let (success, _, error) = validator.validate()
        if let e = error?.description {
            debugPrint("Range Error: ", e)
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
    
    func testPassword() {
        let validator = Validator()
        validator.add(name: "Password1", value: "shtey", rules: [.password()]) // weak password by default
        validator.add(name: "Password2", value: "shteydB", rules: [.password(strength: .weak)])
        validator.add(name: "Password3", value: "qwertyuA", rules: [.password(strength: .medium)])
        validator.add(name: "Password4", value: "qwerfA8B", rules: [.password(strength: .strong)])
        let success = validator.validate().0
        XCTAssertEqual(success, true)
        
        let nvalidator = Validator()
        nvalidator.add(name: "Password1", value: "shte", rules: [.password()]) // weak password by default
        nvalidator.add(name: "Password2", value: "sht7", rules: [.password(strength: .weak)])
        nvalidator.add(name: "Password3", value: "qwertyuo", rules: [.password(strength: .medium)])
        nvalidator.add(name: "Password4", value: "qwerf9yiu", rules: [.password(strength: .strong)])
        nvalidator.add(name: "Password5", value: "qwyiu", rules: [.password(strength: .strong)])
        let verrs = nvalidator.validateAll()
        XCTAssertEqual(verrs.count == 5, true)
    }
    
    func testValidatable() {
        
        struct User : NamedValidatable {
            
            struct Address : Validatable {
                
                struct Location : Validatable {
                    var latitude: Double
                    var longitude: Double
                    
                    func validate() -> ValidationError? {
                        let v = Validator()
                        v.add(name: "Coordinate", value: [longitude, latitude], rules: [.coordinate])
                        return v.validate().2
                    }
                    
                    var description: String {
                        return "Location"
                    }
                }
                
                var city: String
                var country: String
                var location: Location
                
                func validate() -> ValidationError? {
                    let v = Validator()
                    v.add(name: "City", value: city, rules: [.required , .alpha])
                    v.add(name: "Country", value: country, rules: [.required, .alpha])
                    v.add(name: "Location", value: location, rules: [.required, .validatable()])
                    return v.validate().2
                }
                
                var description: String {
                    return "Address"
                }
                
            }
            
            var name: String
            var email: String
            var address: Address?
            
            func validate() -> ValidationError? {
                let v = Validator()
                v.add(name: "Name", value: name, rules: [.required, .fullName])
                v.add(name: "Email", value: email, rules: [.required, .email])
                v.add(name: "Address", value: address, rules: [.required, .validatable()]) // address prpperty is optional but forced to be required
                return v.validate().2
            }
            
            var description: String {
                return "User"
            }
            
        }
        let user = User(name: "Soumen Bhuin", email: "myemail@gmail.com", address: .init(city: "Kolkata", country: "India", location: .init(latitude: 88.3639, longitude: 22.5726)))
        let validator = Validator()
        validator.add(validatable: user)
        let (success, _, error) = validator.validate()
        if let e = error?.description {
            debugPrint("Validatable Error: ", e)
        }
        XCTAssertEqual(success, true)
    }
    
    func testArray() {
        let validator = Validator()
        validator.add(name: "ArrayOfString", value: ["a", "b"], rules: [.array(rules: [.alpha])])
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
        ("Password", testPassword),
        ("Validatable", testValidatable),
    ]
}
