//
//  Validator.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `Validator` represents the key validator object.
 */
public class Validator {
    
    /// Map holding all the validatables
    private var validatables: [NamedValidatable] = []
    
    /**
     Initializes a `Validator` object.
     
     - returns: An initialized object
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
        validatables.append(BasicValidatable<V>(name: name, value: value, rules: rules))
    }
    
    /**
     Add a new custom validatable
     */
    public func add(validatable: NamedValidatable) {
        validatables.append(validatable)
    }
    
    /**
     Removes a validator by its name.
     - parameter name: Name of the validatable. It is case sensitive. eg: Email
     */
    public func remove(named: String) {
        if let index = validatables.firstIndex(where: { $0.description == named }) {
            validatables.remove(at: index)
        }
    }
    
    /**
     Validate all validatables until error. If any error found, it will not try to validate next validatable.
     - throws: Throws `ValidationError` if any `Validatable` is invalid.
     - returns: Returns `true` if valid.
     */
    @discardableResult
    public func validate() throws -> Bool  {
        for validatable in validatables {
            if let error = validatable.validate() {
                throw error
            }
        }
        return true
    }
    
    /**
     Validate all validatables until error. If any error found, it will not try to validate next validatable and return the error.
     - returns: `ValidationError` if any `Validatable` is invalid.
     */
    public func errorOnValidate() -> ValidationError?  {
        for validatable in validatables {
            if let error = validatable.validate() {
                return error
            }
        }
        return nil
    }
    
    /**
     Validate specific validatable by its name
     
     - parameter named: Name of the validatable
     - throws: Throws `ValidationError` if any `Validatable` is invalid.
     - returns: Returns `true` if valid.
     */
    @discardableResult
    public func validate(named: String) throws -> Bool {
        if let validatable = validatables.first(where: { $0.description == named }) {
            if let error = validatable.validate() {
                throw error
            }
        }
        return true
    }
    
    /**
     Validate all validatables even if any error found for one validatable.
     - returns: Array of `ValidationError` if any validatable is invalid otherwise nil.
     */
    public func validateAll() -> [ValidationError]? {
        var results: [ValidationError] = []
        for validatable in validatables {
            if let error = validatable.validate() {
                results.append(error)
            }
        }
        return results.count > 0 ? results : nil
    }
    
    /**
    Finds the first valid `Validatable`
    - returns: `Validatable` that is valid.
    */
    public func firstValid() -> Validatable? {
        for validatable in validatables {
            if validatable.validate() == nil {
                return validatable
            }
        }
        return nil
    }
    
    /**
    Finds the first invalid `Validatable`
    - returns: `Validatable` that is invalid.
    */
    public func firstInvalid() -> Validatable? {
        for validatable in validatables {
            if let _ = validatable.validate() {
                return validatable
            }
        }
        return nil
    }
}
