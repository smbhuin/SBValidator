//
//  AlphaNumericRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `AlphaNumericRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of alphanumeric characters.
 */
public class AlphaNumericRule: CharacterSetRule {
    
    /**
     Initializes a `AlphaNumericRule` object to verify that field has valid set of alphanumeric characters.
     
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message: String = "This value must be alphanumeric") {
        super.init(characterSet: CharacterSet.alphanumerics, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `AlphaNumericRule`
    public class var alphaNumeric: ValidationRule {
        get  {
            return AlphaNumericRule()
        }
    }
    
}

