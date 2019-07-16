//
//  Validator.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `Validator` represents the key validator object.
 */
open class Validator {
    
    private var validatables: [ValidatableProtocol] = []
    
    /**
     Initializes a `Validator` object.
     
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init() {
        
    }
    
    /**
     Add a new validatable
     */
    public func add<V>(name: String, value: V?, rules: [ValidationRule<V>]) {
        validatables.append(Validatable<V>(name: name, value: value, rules: rules))
    }
    
    /**
     Validate all validatables. If any error found, it will not try to validate next value.
     */
    public func validate() -> (Bool, ValidatableProtocol?, ValidationError?) {
        for validatable in validatables {
            if let error = validatable.validate() {
                return (false, validatable, error)
            }
        }
        return (true, nil, nil)
    }
    
    /**
     Validate specific validatable by its name
     
     - parameter name: name of the validatable
     */
    public func validate(name: String) -> (Bool, ValidatableProtocol?, ValidationError?) {
        for validatable in validatables {
            if name == validatable.description, let error = validatable.validate() {
                return (false, validatable, error)
            }
        }
        return (true, nil, nil)
    }
    
}
