//
//  CardExpiryMonthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `CardExpiryMonthRule` is a subclass of `Rule` that defines how a credit/debit's card expiry month field is validated
 */
public class CardExpiryMonthRule: ValidationRule {
    
    /**
     Initializes `CardExpiryMonthRule` object with error message. Used to validate a card's expiry month.
     
     - parameter message: String of error message.
     - returns: An initialized `CardExpiryYearRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message : String = "not a valid month. must be 01 to 12"){
        super.init(message: message)
    }
    
    /**
     Validates a field.
     
     - parameter value: String or Int to check for validation.
     - returns: `ValidationError`. nil on successful validation, otherwise `ValidationError` on failed Validation.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch ad {
        case let d as String:
            guard let month = Int(d) else {
                return error
            }
            if month < 1 && month > 12 {
                return error
            }
        case let d as Int:
            if d < 1 && d > 12 {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `CardExpiryMonthRule`
    class func cardMonth() -> ValidationRule {
        return CardExpiryMonthRule()
    }
    
}
