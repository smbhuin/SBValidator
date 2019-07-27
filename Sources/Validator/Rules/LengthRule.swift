//
//  LengthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 16/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `LengthRule` is a subclass of `ValidationRule` that defines how length is validated with min & max limits.
 */
public class LengthRule : ValidationRule<String> {
    
    private let min: Int
    private let max: Int
    
    /**
     Initializes a `LengthRule` object to verify that length of value is in the range of min & max.
     
     - parameter min: Minimum required length of value.
     - parameter max: Maximum required length of value.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(min: Int, max: Int, message: String? = nil) {
        self.min = min
        self.max = max
        super.init(message: message ?? "is invalid. Must be between \(min) and \(max).")
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: String value to be checked for validation.
     - returns: Error Message String. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        if v.count >= min && v.count <= max {
            return nil
        }
        else {
            return self.message
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `LengthRule`
    class func length(min: Int, max: Int) -> ValidationRule<String> {
        return LengthRule(min: min, max: max)
    }
    
}

