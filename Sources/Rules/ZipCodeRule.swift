//
//  ZipCodeRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ZipCodeRule` is a subclass of `RegexRule` that represents how zip codes are to be validated.
 */
public class ZipCodeRule: RegexRule {
    
    /// Zipcode regular expression string to be used in validation.
    static let regex = "\\d{5}(-\\d{4})?"
    
    /**
     Initializes a `ZipCodeRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object.
     */
    public init(message: String = "is not a valid 5 or 9 digit zipcode."){
        super.init(regex: ZipCodeRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ZipCodeRule`
    class var zipCode: ValidationRule<String> {
        return ZipCodeRule()
    }
    
}
