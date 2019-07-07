//
//  CoordinateRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 07/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ArrayRule` is a subclass of ValidationRule that defines how check if all array elements are valid.
 */
public class ArrayRule: ValidationRule {
    
    /// Rules to be applied for each array elements
    let rules: [ValidationRule]
    
    /**
     Initializes a `ArrayRule` object to validate that provided array has valid elements.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message: String = "This must contains valid elements", rules: [ValidationRule]){
        self.rules = rules
        super.init(message: message)
    }
    
    /**
     Used to validate value.
     
     - parameter value: Array to be checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch ad {
        case let d as [Any]:
            for e in d {
                for rule in rules {
                    if let _ = rule.validate(e) {
                        return error
                    }
                }
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ArrayRule`
    public class func array(rules: [ValidationRule]) -> ValidationRule {
        return ArrayRule(rules: rules)
    }
    
}
