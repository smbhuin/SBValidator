//
//  RequiredRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `RequiredRule` is a subclass of `ValidationRule` that means value can't be nil or blank. Make sure required rule is the first item in rules list
 */
public class RequiredRule<V>: ValidationRule<V> {
    
    /**
     Initializes a `RequiredRule` object that will validate a value is not nil.
     
     - parameter message: String of error message.
     - returns: An initialized `RequiredRule` object.
     */
    public override init(message: String = "can not be blank.") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails. Returns error for empty string or collection
     */
    public override func validate(_ value: V?) -> String? {
        guard let v = value else { return self.message }
        switch v {
        case let d as String:
            if d.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return self.message
            }
        case let d as [Any]:
            if d.isEmpty {
                return self.message
            }
        case let d as [AnyHashable:Any]:
            if d.isEmpty {
                return self.message
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
