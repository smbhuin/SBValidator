//
//  ValidatableRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 17/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ValidatableRule` is a subclass of `ValidationRule` that defines how a object which conforms to `Validatable` protocol is validated.
 */
public class ValidatableRule<Value>: ValidationRule<Value> where Value : Validatable {
    
    public override init(message: String = "") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to checked for validation.
     - returns: `String`. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: Value?) -> String? {
        guard let v = value else { return nil }
        return v.validate()?.description
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ValidatableRule`
    class func validatable<Value>() -> ValidationRule<Value> where Value : Validatable {
        return ValidatableRule<Value>()
    }
    
}

