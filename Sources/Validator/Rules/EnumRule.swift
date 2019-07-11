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
public class EnumRule: ValidationRule {
    
    private let values: [Any]
    
    public init(values: [Any], message: String = "does not match with any possible values") {
        self.values = values
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
            guard let vs = values as? [String],
                vs.contains(d)
                else {
                    return error
            }
        case let d as Int:
            guard let vs = values as? [Int],
                vs.contains(d)
                else {
                    return error
            }
        case let d as Float:
            guard let vs = values as? [Float],
                vs.contains(d)
                else {
                    return error
            }
        case let d as Double:
            guard let vs = values as? [Double],
                vs.contains(d)
                else {
                    return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `EnumRule`
    public class func `enum`(_ values: [Any]) -> ValidationRule {
        return EnumRule(values: values)
    }
    
}

