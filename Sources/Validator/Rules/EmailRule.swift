//
//  EmailRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `EmailRule` is a subclass of RegexRule that defines how a email is validated.
 */
public class EmailRule: RegexRule {
    
    /// Regular express string to be used in validation.
    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    /**
     Initializes an `EmailRule` object to validate an email field.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message: String = "Must be a valid email address"){
        self.init(regex: EmailRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `EmailRule`
    class var email: ValidationRule {
        get  {
            return EmailRule()
        }
    }
    
}
