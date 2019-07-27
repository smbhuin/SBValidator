//
//  Validatable.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
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
    var description: String { get }
}

/**
 Represents all components required for single basic validation to perform.
 */
open class BasicValidatable<Value> : NamedValidatable {
    
    /// Identifier.
    public var name: String
    
    /// Value to be validate.
    public var value: Value?
    
    /// Rules to be applied on value.
    public var rules: [ValidationRule<Value>]
    
    /**
     Initializes a `Validatable` object.
     
     - parameter name: String that used to identify.
     - parameter value: Value to be validate. It could be any type as long as rules support it.
     - parameter rules: Array of validation rules.
     - parameter message: Error message string.
     - returns: An initialized object.
     */
    public init(name: String, value: Value?, rules: [ValidationRule<Value>]) {
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
