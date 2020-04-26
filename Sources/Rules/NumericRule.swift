//
//  NumericRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 23/04/20.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `NumericRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of numeric characters.
 */
public class NumericRule : CharacterSetRule {
    
    /**
     Initializes an `NumericRule` object to verify that a field has valid set of numeric characters.

     - returns: An initialized object, or nil if an object could not be created for some reason.
     */
    public init(message: String = "can have numeric characters only.") {
        super.init(characterSet: CharacterSet.decimalDigits, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `NumericRule`
    class var numeric: ValidationRule<String> {
        get {
            return NumericRule()
        }
    }
    
}
