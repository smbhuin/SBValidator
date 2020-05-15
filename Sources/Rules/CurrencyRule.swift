//
//  CurrencyRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 17/04/20.
//  Copyright © 2020 smbhuin. All rights reserved.
//

import Foundation

/**
 `CurrencyRule` is a subclass of `RegexRule` that represents how currency value are to be validated.
 */
public class CurrencyRule: RegexRule {
    
    /// Currency regular expression string to be used in validation.
    static let regex = "^\\-?\\d{1,10}(\\.\\d{1,2})?$"
    
    /**
     Initializes a `CurrencyRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object.
     */
    public init(message: String = "is not a valid currency amount."){
        super.init(regex: CurrencyRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `CurrencyRule`
    class var currency: ValidationRule<String> {
        get  {
            return CurrencyRule()
        }
    }
    
}
