//
//  CoordinateRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 07/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ArrayRule` is a subclass of ValidationRule that defines how check if all array elements are valid.
 */
public class ArrayRule<V>: ValidationRule<Array<V>> {
    
    /// Rules to be applied for each array elements
    let rules: [ValidationRule<V>]
    
    /**
     Initializes a `ArrayRule` object to validate that provided array has valid elements.
     
     - parameter message: String of error message.
     - returns: An initialized object.
     */
    public init(message: String = "contains invalid element.", rules: [ValidationRule<V>]){
        self.rules = rules
        super.init(message: message)
    }
    
    /**
     Used to validate value.
     
     - parameter value: Array to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: Array<V>?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        let error = self.message
        for e in v {
            for rule in rules {
                if let _ = rule.validate(e) {
                    return error
                }
            }
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ArrayRule`
    class func array<V>(rules: [ValidationRule<V>]) -> ValidationRule<Array<V>> {
        return ArrayRule(rules: rules)
    }
    
}
