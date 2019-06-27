//
//  ValidationError.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ValidationError` represents the error with message when validation fails.
 */
public class ValidationError: Error {
    var message: String
    
    /**
     Initializes a `ValidationError` object with message String.
     
     - parameter message: String that holds error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    init(_ message: String) {
        self.message = message
    }
    
    /**
     Initializes a `ValidationError` object with Inapplicable message String. When a value is not applicable to the validation rule is not app
     
     - returns: An `ValidationError` object
     */
    class func inapplicable() -> ValidationError {
        return .init("Inapplicable Rule")
    }
    
}
