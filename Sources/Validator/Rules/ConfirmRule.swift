//
//  ConfirmRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ConfirmRule` is a subclass of `ValidationRule` that defines how a value that has to be equal
 to another value is validated.
 */
public class ConfirmRule<Value> : ValidationRule<Value> where Value : Equatable {
    
    /// value to which original text field will be compared to.
    private let confirmValue: Value
    
    /**
     Initializes a `ConfirmationRule` object to validate the value that should equal the value to be validated.
     
     - parameter confirmValue: field to which original field will be compared to.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(confirmValue: Value, message: String = "does not match"){
        self.confirmValue = confirmValue
        super.init(message: message)
    }
    
    /**
     Used to validate a value.
     
     - parameter value: Any value to be checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Value?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        if ad == confirmValue {
            return nil
        }
        else {
            return ValidationError(self.message)
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ConfirmRule`
    class func confirm<Value>(_ value: Value) -> ValidationRule<Value> where Value: Equatable {
        return ConfirmRule(confirmValue: value)
    }
    
}
