//
//  PhoneNumberRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `PhoneNumberRule` is a subclass of `RegexRule` that defines how a phone number is validated.
 */
public class PhoneNumberRule: RegexRule {
    
    /// Phone number formats. Each case represents different regular expression string to be used in validation.
    public enum Format {
        case national
        case international // prefixed with +
        
        /// Regular expression string to be used in validation.
        func regex() -> String {
            switch self {
            case .national:
                return "^\\d{4,12}$"
            case .international: // Recommended. Ref: https://www.itu.int/rec/T-REC-E.164
                return "^\\+\\d{1,3}\\d{1,14}$"
            }
        }
        
        /// Error message for each strength types.
        func message() -> String {
            switch self {
            case .national:
                return "is not valid."
            case .international:
                return "is invalid. It must be in international format prefexed with +."
            }
        }
    }
    
    /**
     Initializes a `PhoneNumberRule` object. Used to validate that a field has a valid phone number.
     
    - parameter message: Error message that is displayed if validation fails.
    - returns: An initialized `PhoneNumberRule` object.
    */
    public init(format: PhoneNumberRule.Format, message: String = "") {
        super.init(regex: format.regex(), message: message == "" ? format.message() : message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `PhoneNumberRule`
    class func phoneNumber(format: PhoneNumberRule.Format = .national) -> ValidationRule<String> {
        return PhoneNumberRule(format: format)
    }
    
}
