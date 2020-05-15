//
//  ArrayLengthRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 16/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ArrayLengthRule` is a subclass of `ValidationRule` that defines how length is validated with min & max limits.
 */
public class ArrayLengthRule<V> : ValidationRule<Array<V>> {
    
    private let min: Int
    private let max: Int
    
    /**
     Initializes a `ArrayLengthRule` object to verify that length of value is in the range of min & max.
     
     - parameter min: Minimum required length of value.
     - parameter max: Maximum required length of value.
     - parameter message: String of error message.
     - returns: An initialized object.
     */
    public init(min: Int, max: Int, message: String? = nil) {
        self.min = min
        self.max = max
        super.init(message: message ?? "is invalid. Must be between \(min) and \(max).")
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any Array value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: Array<V>?) -> String? {
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
    
    /// Quick accessor for `ArrayLengthRule`
    class func arrayLength<V>(min: Int, max: Int) -> ValidationRule<Array<V>> {
        return ArrayLengthRule(min: min, max: max)
    }
    
}

