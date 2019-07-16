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
public class RequiredRule<Value>: ValidationRule<Value> {
    
    /**
     Initializes a `RequiredRule` object that will validate a value is not nil.
     
     - parameter message: String of error message.
     - returns: An initialized `RequiredRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "can not be blank") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails. Returns error for empty string or collection
     */
    public override func validate(_ value: Value?) -> ValidationError? {
        let error = ValidationError(self.message)
        guard let v = value else { return error }
        switch v {
        case let d as String:
            if d.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return error
            }
        case let d as [Any]:
            if d.isEmpty {
                return error
            }
        case let d as [AnyHashable:Any]:
            if d.isEmpty {
                return error
            }
        default:
            return nil
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RequiredRule`
    class var required: ValidationRule {
        get  {
            return RequiredRule()
        }
    }
    
}
