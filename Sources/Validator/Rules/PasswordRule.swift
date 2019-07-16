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
    
    /// Strength of password
    public enum Strength {
        /// 5 characters.
        case weak
        /// 8 characters. One uppercase.
        case medium
        /// 8 characters. One uppercase. One Lowercase. One number.
        case strong
        
        /// Regular express string to be used in validation.
        func regex() -> String {
            switch self {
            case .weak:
                return "^.{5,}$"
            case .medium:
                return "^(?=.*?[A-Z]).{8,}$"
            case .strong:
                return "^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[a-z]).{8,}$"
            }
        }
        
        /// Error message for each strength types.
        func message() -> String {
            switch self {
            case .weak:
                return "is invalid. it must contain 5 characters"
            case .medium:
                return "is invalid. it must contain 8 characters with 1 uppercase"
            case .strong:
                return "is invalid. it must contain 8 characters with 1 uppercase, 1 lowercase and 1 number"
            }
        }
    }
    
    /**
     Initializes a `PasswordRule` object that will validate a field is a valid password.
     
     - parameter strength: `PasswordRule.Strength`.
     - parameter message: String of error message.
     - returns: An initialized `PasswordRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(strength: PasswordRule.Strength = .weak, message: String = "") {
        self.init(regex: strength.regex(), message: message == "" ? strength.message() : message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `PasswordRule`
    class func password(strength: PasswordRule.Strength = .weak) -> ValidationRule<String> {
        return PasswordRule(strength: strength)
    }
    
}
