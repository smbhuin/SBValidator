//
//  ISBNRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ISBNRule` is a subclass of `Rule`. It is used to verify whether a field is a valid ISBN number.
 */
public class ISBNRule: ValidationRule {
    
    /**
     Initializes a `ISBNRule` object to verify that value is a ISBN number.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "is not a valid ISBN number") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch ad {
        case let d as String:
            guard let regex = try? NSRegularExpression(pattern: "[\\s-]", options: []) else {
                fatalError("Invalid ISBN sanitizing regex")
            }
            let sanitized = regex.stringByReplacingMatches(in: d, options: [], range: NSMakeRange(0, d.count), withTemplate: "")
            if !(ISBN10Validator().verify(sanitized) || ISBN13Validator().verify(sanitized)) {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ISBNRule`
    public class var ISBN: ValidationRule {
        get  {
            return ISBNRule()
        }
    }
    
}

/**
 `ISBNValidator` defines the protocol that objects adopting it must implement.
*/
private protocol ISBNValidator {
    
    /// Regular expression string
    var regex: String { get }
    
    /** 
     Method that actually verifies a ISBN number.
     
     - parameter input: String that is to be validated against `ISBNRule`
     - returns: A `Bool` that represents what happened during verification. `false` is returned if
     it fails, `true` is returned if it was a success.
    */
    func verify(_ input: String) -> Bool
    /**
     Method that verifies regular expression is valid.
     
     - parameter input: String that holds ISBN number being validated.
     - returns: A `Bool` that represents the status of the ISBN number. `false` if ISBN number
     was not valid, `true` if it was valid.
     */
    func checkRegex(_ input: String) -> Bool
    
    /**
     Method that verifies `ISBN` being validated is itself valid. It has to be either ISBN10
     or ISBN13.
     
     - parameter input: String that holds ISBN number being validated.
     - returns: A `Bool` that represents the status of the ISBN number. `false` if ISBN number
     was not valid, `true` if it was valid.
     */
    func verifyChecksum(_ input: String) -> Bool
    
}

/**
 `ISBNValidator` defines the extensions that are added to `ISBNValidator`.
 */
private extension ISBNValidator {
    
    /**
     Method that actually verifies a ISBN number.
     
     - parameter input: String that is to be validated against `ISBNRule`
     - returns: A `Bool` that represents what happened during verification. `false` is returned if
     it fails, `true` is returned if it was a success.
     */
    func verify(_ input: String) -> Bool {
        return checkRegex(input) && verifyChecksum(input)
    }
    
    /**
     Method that verifies `ISBN` being validated is itself valid. It has to be either ISBN10
     or ISBN13.
     
     - parameter input: String that holds ISBN number being validated.
     - returns: A `Bool` that represents the status of the ISBN number. `false` if ISBN number
     was not valid, `true` if it was valid.
     */
    func checkRegex(_ input: String) -> Bool {
        guard let _ = input.range(of: regex, options: [.regularExpression, .anchored]) else  {
            return false
        }
        return true
    }
    
}

/**
 `ISBN10Validator` is a struct that adopts the `ISBNValidator` protocol. Used to validate that
 a field is an ISBN10 number.
*/
private struct ISBN10Validator: ISBNValidator {
    
    /// Regular expression used to validate ISBN10 number
    let regex = "^(?:[0-9]{9}X|[0-9]{10})$"
    
    /**
     Checks that a string is an ISBN10 number.
     
     - parameter input: String that is checked for ISBN10 validation.
     - returns: `true` if string is a valid ISBN10 and `false` if it is not.
    */
    fileprivate func verifyChecksum(_ input: String) -> Bool {
        var checksum = 0
        for i in 0..<9 {
            if let intCharacter = Int(String(input[input.index(input.startIndex, offsetBy: i)])) {
                checksum += (i + 1) * intCharacter
            }
        }
        if (input[input.index(input.startIndex, offsetBy: 9)] == "X") {
            checksum += 10 * 10
        } else {
            if let intCharacter = Int(String(input[input.index(input.startIndex, offsetBy: 9)])) {
                checksum += 10 * intCharacter
            }
        }
        return ((checksum % 11) == 0)
    }
    
}

/**
 `ISBN13Validator` is a struct that adopts the `ISBNValidator` protocol. Used to validate that
 a field is an ISBN13 number.
*/
private struct ISBN13Validator: ISBNValidator {
    
    /// Regular expression used to validate ISBN13 number.
    let regex = "^(?:[0-9]{13})$"
    
    /**
     Checks that a string is an ISBN13 number.
     
     - parameter input: String that is checked for ISBN13 validation.
     - returns: `true` if string is a valid ISBN13 and `false` if it is not.
     */
    fileprivate func verifyChecksum(_ input: String) -> Bool {
        let factor = [1, 3]
        var checksum = 0
        
        for i in 0..<12 {
            if let intCharacter = Int(String(input[input.index(input.startIndex, offsetBy: i)])) {
                print("\(factor[i%2]) * \(intCharacter)")
                checksum += factor[i % 2] * intCharacter
            }
        }
        
        if let lastInt = Int(String(input[input.index(input.startIndex, offsetBy: 12)])) {
            return (lastInt - ((10 - (checksum % 10)) % 10) == 0)
        }
        
        return false
    }
    
}
