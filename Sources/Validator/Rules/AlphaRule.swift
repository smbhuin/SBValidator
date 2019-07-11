//
//  AlphaRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `AlphaRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of alpha characters.
 */
public class AlphaRule: CharacterSetRule {
    
    /**
     Initializes an `AlphaRule` object to verify that a field has valid set of alpha characters.

     - returns: An initialized object, or nil if an object could not be created for some reason.
     */
    public init(message: String = "can have alpha characters only") {
        super.init(characterSet: CharacterSet.letters, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `AlphaRule`
    class var alpha: ValidationRule {
        get  {
            return AlphaRule()
        }
    }
    
}
