//
//  ConfirmRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ConfirmRule` is a subclass of Rule that defines how a value that has to be equal
 to another value is validated.
 */
public class ConfirmRule: ValidationRule {
    
    /// value to which original text field will be compared to.
    private let confirmValue: Any
    
    /**
     Initializes a `ConfirmationRule` object to validate the value that should equal the value to be validated.
     
     - parameter confirmValue: field to which original field will be compared to.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(confirmValue: Any, message: String = "does not match"){
        self.confirmValue = confirmValue
        super.init(message: message)
    }
    
    /**
     Used to validate a value.
     
     - parameter value: Any value to be checked for validation.
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
            if let c = confirmValue as? String, d != c {
                return error
            }
        case let d as Int:
            if let c = confirmValue as? Int, d != c {
                return error
            }
        case let d as Float:
            if let c = confirmValue as? Float, d != c {
                return error
            }
        case let d as Double:
            if let c = confirmValue as? Double, d != c {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ConfirmRule`
    public class func confirm(_ value: Any) -> ValidationRule {
        return ConfirmRule(confirmValue: value)
    }
    
}
