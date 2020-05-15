//
//  AlphaNumericRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `AlphaNumericRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of alphanumeric characters.
 */
public class AlphaNumericRule : CharacterSetRule {
    
    /**
     Initializes a `AlphaNumericRule` object to verify that field has valid set of alphanumeric characters.
     
     - returns: An initialized object.
     */
    public init(message: String = "is not alphanumeric.") {
        super.init(characterSet: CharacterSet.alphanumerics, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `AlphaNumericRule`
    class var alphaNumeric: ValidationRule<String> {
        return AlphaNumericRule()
    }
    
}

