//
//  ValidationRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ValidationRule` is the parent of all validation rules.
 */
open class ValidationRule<Value> {
    
    /// String that holds error message.
    var message: String
    
    /**
     Initializes an `ValidationRule` object. Should be inherited by child classes
     
     - returns: An initialized object, or nil if an object could not be created for some reason.
     */
    public init(message: String) {
        self.message = message
    }
    
    /**
     Validates value.
     
     - parameter value: Any value to be validated.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    open func validate(_ value: Value?) -> String? {
        return nil
    }
    
}
