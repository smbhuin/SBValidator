//
//  FloatRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `FloatRule` is a subclass of `RegexRule` that defines how to check if a value is a floating point value.
 */
public class FloatRule : RegexRule {
    
    /// Floating point regular expression string to be used in validation.
    static let regex = "^[-+]?(\\d*[.])?\\d+$"
    
    /**
     Initializes a `FloatRule` object to validate that the text of a field is a floating point number.
     
     - parameter message: String of error message.
     - returns: An initialized object.
     */
    public init(message: String = "must be a number with or without a decimal point.") {
        super.init(regex: FloatRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `FloatRule`
    class var floatingPoint: ValidationRule<String> {
        return FloatRule()
    }
    
}
