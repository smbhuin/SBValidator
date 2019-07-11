//
//  ExactLengthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ExactLengthRule` is a subclass of Rule that is used to make sure a the text of a field is an exact length.
 */
public class ExactLengthRule: ValidationRule {
    
    /// parameter length: Integer value string length
    private var length : Int
    
    /**
     Initializes an `ExactLengthRule` object to validate the text of a field against an exact length.
     
     - parameter length: Integer value of exact string length being specified.
     - parameter message: String of error message.
     - returns: An initialized `ExactLengthRule` object, or nil if an object could not be created for some reason. that would not result in an exception.
     */
    public init(length: Int, message: String = "must be exactly %ld characters/count in length"){
        self.length = length
        super.init(message: String(format: message, self.length))
    }
    
    /**
     Used to validate lenght of string or count of countable objects.
     
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
            if d.count != length {
                return error
            }
        case let d as Array<Any>:
            if d.count != length {
                return error
            }
        case let d as Dictionary<AnyHashable,Any>:
            if d.count != length {
                return error
            }
        case let d as Set<AnyHashable>:
            if d.count != length {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ExactLengthRule`
    class func exactLength(_ length: Int) -> ValidationRule {
        return ExactLengthRule(length: length)
    }
    
}
