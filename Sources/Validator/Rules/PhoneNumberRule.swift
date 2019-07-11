//
//  PhoneNumberRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `PhoneNumberRule` is a subclass of Rule that defines how a phone number is validated.
 */
public class PhoneNumberRule: RegexRule {
    
    /// Phone number regular express string to be used in validation.
    static let regex = "^\\d{10}$" //"^\\d{3}-\\d{3}-\\d{4}$"
    
    /**
     Initializes a `PhoneNumberRule` object. Used to validate that a field has a valid phone number.
     
    - parameter message: Error message that is displayed if validation fails.
    - returns: An initialized `PhoneNumberRule` object, or nil if an object could not be created for some reason that would not result in an exception.
    */
    public convenience init(message: String = "is not a valid 10 digit phone number") {
        self.init(regex: PhoneNumberRule.regex, message : message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `PhoneNumberRule`
    public class var phoneNumber: ValidationRule {
        get  {
            return PhoneNumberRule()
        }
    }
    
}
