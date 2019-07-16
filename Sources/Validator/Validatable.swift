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
public protocol ValidatableProtocol: CustomStringConvertible {
    func validate() -> ValidationError?
}

/**
 Represents all components required for single validation to perform.
 */
open class Validatable<Value> : ValidatableProtocol {
    
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
            if let error = rule.validate(value) {
                return error
            }
        }
        return nil
    }
    
    /// Description of Validatable
    public var description: String {
        return name
    }
    
}
