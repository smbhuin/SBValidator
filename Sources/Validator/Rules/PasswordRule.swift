//
//  PasswordRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `PasswordRule` is a subclass of `RegexRule` that defines how a password is validated.
 */
public class PasswordRule : RegexRule {
    
    // Alternative Regexes
    
    // 8 characters. One uppercase. One Lowercase. One number.
    // static let regex = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).{8,}$"
    //
    // no length. One uppercase. One lowercae. One number.
    // static let regex = "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).*?$"
    
    /// Regular express string to be used in validation.
    static let regex = "^(?=.*?[A-Z]).{8,}$"
    
    /**
     Initializes a `PasswordRule` object that will validate a field is a valid password.
     
     - parameter message: String of error message.
     - returns: An initialized `PasswordRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message: String = "Must be 8 characters with 1 uppercase") {
        super.init(regex: PasswordRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `PasswordRule`
    public class var password: ValidationRule {
        get  {
            return PasswordRule()
        }
    }
    
}
