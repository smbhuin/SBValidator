//
//  RangeRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `RangeRule` is a subclass of `ValidationRule` that defines how lingth is validated with min & max limits.
 */
public class RangeRule: ValidationRule {
    
    private let min: Int
    private let max: Int
    
    /**
     Initializes a `RangeRule` object to verify that length/size of value is in the range of min & max.
     
     - parameter min: Minimum required length/size/quantity of value.
     - parameter max: Maximum required length/size/quantity of value.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(min: Int, max: Int, message: String = "length/size is invalid") {
        self.min = min
        self.max = max
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
            if d.count < min || d.count > max {
                return error
            }
        case let d as Int:
            if d < min || d > max {
                return error
            }
        case let d as Array<Any>:
            if d.count < min || d.count > max {
                return error
            }
        case let d as Dictionary<AnyHashable,Any>:
            if d.count < min || d.count > max {
                return error
            }
        case let d as Set<AnyHashable>:
            if d.count < min || d.count > max {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RangeRule`
    class func range(min: Int, max: Int) -> ValidationRule {
        return RangeRule(min: min, max: max)
    }
    
}

