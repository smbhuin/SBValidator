import XCTest
@testable import SBValidator

final class ValidatorTests: XCTestCase {
    
    func testRequired() {
        let validator = Validator()
        validator.add(name: "required", value: "asdf", rules: [.required])
        validator.add(name: "required2", value: ["a","b"], rules: [.required])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
        let str: String? = nil
        let validatorNeg = Validator()
        validatorNeg.add(name: "required", value: "", rules: [.required])
        validatorNeg.add(name: "required2", value: str, rules: [.required])
        let successNeg = try? validatorNeg.validate()
        XCTAssertEqual(successNeg, nil)
    }
    
    func testNumeric() {
        let validator = Validator()
        validator.add(name: "required", value: "12568", rules: [.numeric])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testCurrency() {
        let validator = Validator()
        validator.add(name: "Price 1", value: "12.50", rules: [.currency])
        validator.add(name: "Price 2", value: "12.00", rules: [.currency])
        validator.add(name: "Price 3", value: "0.50", rules: [.currency])
        validator.add(name: "Price 4", value: "-12.50", rules: [.currency])
        validator.add(name: "Price 5", value: "12", rules: [.currency])
        if let firstInvalid = validator.firstInvalid() {
            XCTAssertTrue(false, (firstInvalid as! NamedValidatable).description)
        }
        
        let validatorNeg = Validator()
        validatorNeg.add(name: "Price 1", value: "-.50", rules: [.currency])
        validatorNeg.add(name: "Price 2", value: "+.50", rules: [.currency])
        validatorNeg.add(name: "Price 3", value: "0.", rules: [.currency])
        validatorNeg.add(name: "Price 4", value: "-.", rules: [.currency])
        validatorNeg.add(name: "Price 5", value: "a", rules: [.currency])
        validatorNeg.add(name: "Price 6", value: ".", rules: [.currency])
        if let firstValid = validatorNeg.firstValid() {
            XCTAssertTrue(false, (firstValid as! NamedValidatable).description)
        }
        
    }
    
    func testPhone() {
        let validator = Validator()
        validator.add(name: "Mobile", value: "+917894586235", rules: [.phoneNumber(format: .international)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
        
        let validatorNeg = Validator()
        validatorNeg.add(name: "Phone", value: "-789564257", rules: [.phoneNumber()])
        let successNeg = try? validatorNeg.validate()
        XCTAssertEqual(successNeg, nil)
    }
    
    func testFullname() {
        let validator = Validator()
        validator.add(name: "My Name", value: "Soumen Bhuin", rules: [FullNameRule()])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testAlpha() {
        let validator = Validator()
        validator.add(name: "City", value: "Kolkata", rules: [.alpha])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testAlphaNumeric() {
        let validator = Validator()
        validator.add(name: "pan", value: "XLQCO9425A", rules: [.alphaNumeric])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testEmail() {
        let validator = Validator()
        let validEmails = ["email@domain.com","firstname.lastname@domain.com","email@subdomain.domain.com","firstname+lastname@domain.com","1234567890@domain.com","email@domain-one.com","_______@domain.com","email@domain.name","email@domain.co.jp","firstname-lastname@domain.com",]
        for (i, v) in validEmails.enumerated() {
            validator.add(name: "email\(i)", value: v, rules: [.email])
        }
        do {
            try validator.validate()
        } catch {
            XCTAssertThrowsError(error)
        }
        
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
        
        if let errors = nvalidator.validateAll(), errors.count != invalidEmails.count {
            for e in errors {
                debugPrint(e.description)
            }
            XCTAssertEqual(errors.count == invalidEmails.count, true)
        }
        
    }
    
    func testEnum() {
        let validator = Validator()
        validator.add(name: "gender", value: "male", rules: [.enum(["male","female"])])
        validator.add(name: "genderNumber", value: 1, rules: [.enum([0,1,2])])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testYearExpiry() {
        let validator = Validator()
        validator.add(name: "CardYear", value: "2018", rules: [.yearExpiry(validity: 3)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testMonth() {
        let validator = Validator()
        validator.add(name: "Month", value: "05", rules: [.month])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testRange() {
        let validator = Validator()
        validator.add(name: "MonthNil", value: nil, rules: [.range(min:1, max:12)])
        validator.add(name: "Month", value: 3, rules: [.range(min:1, max:12)])
        do {
            try validator.validate()
        } catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func testExactLength() {
        let validator = Validator()
        validator.add(name: "Month", value: "JAN", rules: [.exactLength(3)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testConfirm() {
        let validator = Validator()
        validator.add(name: "Password", value: "Pass1234", rules: [.confirm("Pass1234")])
        validator.add(name: "Gender", value: 1, rules: [.confirm(1)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testLength() {
        let validator = Validator()
        validator.add(name: "Password", value: "Pass1234", rules: [.length(min: 5, max: 16)])
        validator.add(name: "Notes", value: [10, 20, 50, 100, 200, 500, 1000, 2000], rules: [.arrayLength(min: 5, max: 16)])
        validator.add(name: "Days", value: ["Sun", "Mon", "Tue"], rules: [.arrayLength(min: 1, max: 7)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testCoordinate() {
        let validator = Validator()
        validator.add(name: "LatLong", value: [88.3639, 22.5726], rules: [.coordinate])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    func testPassword() {
        let validator = Validator()
        validator.add(name: "Password1", value: "shtey", rules: [.password()]) // weak password by default
        validator.add(name: "Password2", value: "shteydB", rules: [.password(strength: .weak)])
        validator.add(name: "Password3", value: "qwertyuA", rules: [.password(strength: .medium)])
        validator.add(name: "Password4", value: "qwerfA8B", rules: [.password(strength: .strong)])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
        
        let nvalidator = Validator()
        nvalidator.add(name: "Password1", value: "shte", rules: [.password()]) // weak password by default
        nvalidator.add(name: "Password2", value: "sht7", rules: [.password(strength: .weak)])
        nvalidator.add(name: "Password3", value: "qwertyuo", rules: [.password(strength: .medium)])
        nvalidator.add(name: "Password4", value: "qwerf9yiu", rules: [.password(strength: .strong)])
        nvalidator.add(name: "Password5", value: "qwyiu", rules: [.password(strength: .strong)])
        if let verrs = nvalidator.validateAll() {
            XCTAssertEqual(verrs.count == 5, true)
        }
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
                        return v.errorOnValidate()
                    }
                    
                }
                
                struct NearByPlace : Validatable {
                    var name: String
                    var type: String
                    
                    func validate() -> ValidationError? {
                        let v = Validator()
                        v.add(name: "Name", value: name, rules: [.required, .length(min: 1, max: 20)])
                        v.add(name: "Type", value: type, rules: [.required, .length(min: 1, max: 20)])
                        return v.errorOnValidate()
                    }
                }
                
                var city: String
                var country: String
                var location: Location
                var nearByPlaces: [NearByPlace]
                
                func validate() -> ValidationError? {
                    let v = Validator()
                    v.add(name: "City", value: city, rules: [.required , .alpha])
                    v.add(name: "Country", value: country, rules: [.required, .alpha])
                    v.add(name: "Location", value: location, rules: [.required, .validatable()])
                    v.add(name: "NearByPlaces", value: nearByPlaces, rules: [.required, .arrayLength(min: 1, max: 3), .array(rules: [.validatable()])])
                    return v.errorOnValidate()
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
                return v.errorOnValidate()
            }
            
            var description: String {
                return "User"
            }
            
        }
        let user = User(name: "Soumen Bhuin", email: "myemail@gmail.com", address: .init(city: "Kolkata", country: "India", location: .init(latitude: 88.3639, longitude: 22.5726), nearByPlaces: [.init(name: "Unique Bank", type: "Bank")]))
        let validator = Validator()
        validator.add(validatable: user)
        do {
            try validator.validate()
        } catch {
            XCTAssertThrowsError(error)
        }
    }
    
    func testArray() {
        let validator = Validator()
        validator.add(name: "ArrayOfString", value: ["a", "b"], rules: [.array(rules: [.alpha])])
        let success = try? validator.validate()
        XCTAssertEqual(success, true)
    }
    
    static var allTests = [
        ("FullName", testFullname),
        ("Alpha", testAlpha),
        ("AlphaNumeric", testAlphaNumeric),
        ("Currency", testCurrency),
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
