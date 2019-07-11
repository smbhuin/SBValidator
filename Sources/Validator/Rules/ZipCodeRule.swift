//
//  ZipCodeRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ZipCodeRule` is a subclass of `RegexRule` that represents how zip codes are to be validated.
 */
public class ZipCodeRule: RegexRule {
    
    /// Zipcode regular express string to be used in validation.
    static let regex = "\\d{5}(-\\d{4})?"
    
    /**
     Initializes a `ZipCodeRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message: String = "is not a valid 5 or 9 digit zipcode"){
        super.init(regex: ZipCodeRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ZipCodeRule`
    public class var zipcode: ValidationRule {
        get  {
            return ZipCodeRule()
        }
    }
    
}
