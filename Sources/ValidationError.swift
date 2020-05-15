//
//  ValidationError.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ValidationError` represents the error with message when validation fails.
 */
public struct ValidationError: Error, CustomStringConvertible {
    
    /// Error Message String
    private var message: String
    
    /// Validatible responsible for the error
    public var validatable: NamedValidatable
    
    /**
     Initializes a `ValidationError` object with message String.
     
     - parameter message: String that holds error message.
     - parameter for: Validatable responsible for the error.
     - returns: An initialized object.
     */
    public init(_ message: String, for validatable: NamedValidatable) {
        self.message = message
        self.validatable = validatable
    }
    
    /// Error Description
    public var description: String {
        get {
            return message
        }
    }
    
}
