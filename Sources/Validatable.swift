//
//  Validatable.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 Represents a validatable.
 */
public protocol Validatable {
    func validate() -> ValidationError?
}

/**
 Represents a named validatable.
 */
public protocol NamedValidatable : Validatable, CustomStringConvertible {
    
}

/**
 Represents all components required for single basic validation to perform.
 */
public class BasicValidatable<V> : NamedValidatable {
    
    /// Identifier.
    private var name: String
    
    /// Value to be validate.
    private var value: V?
    
    /// Rules to be applied on value.
    private var rules: [ValidationRule<V>]
    
    /**
     Initializes a `Validatable` object.
     
     - parameter name: String that used to identify.
     - parameter value: Value to be validate. It could be any type as long as rules support it.
     - parameter rules: Array of validation rules.
     - parameter message: Error message string.
     - returns: An initialized object.
     */
    public init(name: String, value: V?, rules: [ValidationRule<V>]) {
        self.name = name
        self.value = value
        self.rules = rules
    }
    
    /**
     Validate.
     
     - returns: `ValidationError` if fails otherwise nil.
     */
    public func validate() -> ValidationError? {
        for rule in rules {
            if let errorMessage = rule.validate(value) {
                let separator = value is Validatable ? "/" : " "
                return ValidationError(self.name + separator + errorMessage)
            }
        }
        return nil
    }
    
    /// Name of the validatable
    public var description: String {
        return name
    }
    
}
