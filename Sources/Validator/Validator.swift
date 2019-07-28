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
public class Validator {
    
    /// Map holding all the validatables
    private var validatables: [String : NamedValidatable] = [:]
    
    /**
     Initializes a `Validator` object.
     
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init() {
        
    }
    
    /**
     Add a new basic validatable.
     - parameter name: Name of the validatable. Name must be unique for each cases. eg: Email
     - parameter value: Value of the validatable. eg: name@domain.com
     - parameter rules: Array of `ValidationRule`
     */
    public func add<V>(name: String, value: V?, rules: [ValidationRule<V>]) {
        validatables[name] = BasicValidatable<V>(name: name, value: value, rules: rules)
    }
    
    /**
     Add a new custom validatable
     */
    public func add(validatable: NamedValidatable) {
        validatables[validatable.description] = validatable
    }
    
    /**
     Removes a validator by its name.
     - parameter name: Name of the validatable. eg: Email
     */
    public func remove(named: String) {
        validatables[named] = nil
    }
    
    /**
     Validate all validatables until error. If any error found, it will not try to validate next validatable.
     - returns: `(valid: Bool, validatable: NamedValidatable?, error: ValidationError?)`
     */
    public func validate() -> (valid: Bool, validatable: NamedValidatable?, error: ValidationError?) {
        for (_, validatable) in validatables {
            if let error = validatable.validate() {
                return (false, validatable, error)
            }
        }
        return (true, nil, nil)
    }
    
    /**
     Validate specific validatable by its name
     
     - parameter named: name of the validatable
     - returns: `(valid: Bool, validatable: NamedValidatable?, error: ValidationError?)`
     */
    public func validate(named: String) -> (valid: Bool, validatable: NamedValidatable?, error: ValidationError?) {
        for (_, validatable) in validatables {
            if named == validatable.description, let error = validatable.validate() {
                return (false, validatable, error)
            }
        }
        return (true, nil, nil)
    }
    
    /**
     Validate all validatables even if any error found for one validatable.
     - returns: Array of `(validatable: NamedValidatable, error: ValidationError)`
     */
    public func validateAll() -> [(validatable: NamedValidatable, error: ValidationError)] {
        var results: [(NamedValidatable, ValidationError)] = []
        for (_, validatable) in validatables {
            if let error = validatable.validate() {
                results.append((validatable, error))
            }
        }
        return results
    }
    
}
