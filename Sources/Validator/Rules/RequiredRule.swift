//
//  RequiredRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `RequiredRule` is a subclass of `ValidationRule` that means value can't be nil or blank. Make sure required rule is the first item in rules list
 */
public class RequiredRule: ValidationRule {
    
    /**
     Initializes a `RequiredRule` object that will validate a value is not nil.
     
     - parameter message: String of error message.
     - returns: An initialized `RequiredRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "This is required") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        let error = ValidationError(self.message)
        guard let ad = value
            else  {
                return error
        }
        switch ad {
        case let d as String:
            if d.count == 0 {
                return error
            }
        case let d as Int:
            if d == 0 {
                return error
            }
        case let d as Float:
            if d == 0.0 {
                return error
            }
        case let d as Double:
            if d == 0.0 {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RequiredRule`
    public class var required: ValidationRule {
        get  {
            return RequiredRule()
        }
    }
    
}
