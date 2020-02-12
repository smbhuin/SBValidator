//
//  RangeRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `RangeRule` is a subclass of `ValidationRule` that defines how value is validated with min & max limits.
 */
public class RangeRule<V> : ValidationRule<V> where V : Comparable, V : CustomStringConvertible {
    
    private let min: V
    private let max: V
    
    /**
     Initializes a `RangeRule` object to verify that quantity of value is in the range of min & max.
     
     - parameter min: Minimum required quantity of value.
     - parameter max: Maximum required quantity of value.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(min: V, max: V, message: String? = nil) {
        self.min = min
        self.max = max
        super.init(message: message ?? "is invalid. must be between \(min) and \(max).")
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: V?) -> String? {
        guard let v = value else { return nil }
        if v >= min && v <= max {
            return nil
        }
        else {
            return self.message
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RangeRule`
    class func range<V>(min: V, max: V) -> ValidationRule<V> where V : Comparable, V : CustomStringConvertible {
        return RangeRule(min: min, max: max)
    }
    
}

