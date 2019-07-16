//
//  EnumRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 27/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `EnumRule` is a subclass of `ValidationRule` that defines how a value is validated against mutiple possible values.
 */
public class EnumRule<Value>: ValidationRule<Value> where Value: Equatable {
    
    private let values: [Value]
    
    public init(values: [Value], message: String = "does not match with any possible values") {
        self.values = values
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Value?) -> ValidationError? {
        guard let v = value else { return nil }
        if values.contains(v) {
            return nil
        }
        else {
            return ValidationError(self.message)
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `EnumRule`
    class func `enum`<Value>(_ values: [Value]) -> ValidationRule<Value>  where Value: Equatable {
        return EnumRule(values: values)
    }
    
}

