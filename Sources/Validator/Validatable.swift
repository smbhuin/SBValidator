//
//  Validatable.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 Represents all components required for single validation to perform.
 */
open class Validatable {
    
    /// Identifier.
    public var name: String
    
    /// Value to be validate.
    public var value: Any?
    
    /// Rules to be applied on value.
    public var rules: [ValidationRule]
    
    /// This will suppress the individual rule error message.
    public var message: String?
    
    /**
     Initializes a `Validatable` object.
     
     - parameter name: String that used to identify.
     - parameter value: Value to be validate. It could be any type as long as rules support it.
     - parameter rules: Array of validation rules.
     - parameter message: String for error message.
     - returns: An initialized object.
     */
    public init(name: String, value: Any?, rules: [ValidationRule], message: String? = nil) {
        self.name = name
        self.value = value
        self.rules = rules
        self.message = message
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
    
}
