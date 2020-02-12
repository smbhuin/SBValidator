//
//  EnumRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 27/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `EnumRule` is a subclass of `ValidationRule` that defines how a value is validated against mutiple possible values.
 */
public class EnumRule<V>: ValidationRule<V> where V: Equatable {
    
    private let values: [V]
    
    public init(values: [V], message: String = "does not match with any possible values.") {
        self.values = values
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: V?) -> String? {
        guard let v = value else { return nil }
        if values.contains(v) {
            return nil
        }
        else {
            return self.message
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `EnumRule`
    class func `enum`<V>(_ values: [V]) -> ValidationRule<V>  where V: Equatable {
        return EnumRule(values: values)
    }
    
}

