//
//  PinCodeRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 15/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `PinCodeRule` is a subclass of `RegexRule` that represents how indian pin codes are to be validated.
 */
public class PinCodeRule: RegexRule {
    
    /// PinCode regular expression string to be used in validation.
    static let regex = "\\d{6}"
    
    /**
     Initializes a `PinCodeRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object.
     */
    public init(message: String = "is not a valid 6 digit pincode."){
        super.init(regex: PinCodeRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `PinCodeRule`
    class var pinCode: ValidationRule<String> {
        get  {
            return PinCodeRule()
        }
    }
    
}
