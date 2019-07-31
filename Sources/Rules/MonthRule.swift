//
//  MonthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `MonthRule` is a subclass of `ValidationRule` that defines how a credit/debit's card expiry month field is validated
 */
public class MonthRule : ValidationRule<String> {
    
    /**
     Initializes `MonthRule` object with error message. Used to validate a month represented as number.
     
     - parameter message: String of error message.
     - returns: An initialized `MonthRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message : String = "not a valid month. must be 01 to 12."){
        super.init(message: message)
    }
    
    /**
     Validates a field.
     
     - parameter value: String to check for validation.
     - returns: Error Message. nil on successful validation, otherwise `String` on failed Validation.
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        if let month = Int(v), month >= 1 && month <= 12 {
            return nil
        }
        return self.message
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `MonthRule`
    class func month() -> ValidationRule<String> {
        return MonthRule()
    }
    
}
