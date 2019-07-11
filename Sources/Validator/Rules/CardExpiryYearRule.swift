//
//  CardExpiryYearRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `CardExpiryYearRule` is a subclass of `Rule` that defines how a credit/debit's card expiry year field is validated
 */
public class CardExpiryYearRule: ValidationRule {
    
    ///Default maximum validity period. Change to preferred value
    private var MAX_VALIDITY: Int = 3

    /**
     Initializes `CardExpiryYearRule` object with error message. Used to validate a card's expiry year.
     
     - parameter message: String of error message.
     - returns: An initialized `CardExpiryYearRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message : String = "must be within 3 years of validity"){
        super.init(message: message)
    }

    /**
     Validates a field.
     
     - parameter value: String or Int to check for validation.
     - returns: `ValidationError`. nil on successful validation, otherwise `ValidationError` on failed Validation.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        guard let v = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch v {
        case let year as Int:
            // Holds the current year
            let thisYear = Calendar.current.component(Calendar.Component.year, from: Date())
            if year < thisYear || year > (thisYear + MAX_VALIDITY) {
                return error
            }
        case let s as String:
            guard let year = Int(s) else {
                return error
            }
            // Holds the current year
            let thisYear = Calendar.current.component(Calendar.Component.year, from: Date())
            if year < thisYear || year > (thisYear + MAX_VALIDITY) {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }

}

public extension ValidationRule {
    
    /// Quick accessor for `CardExpiryYearRule`
    public class func cardYear() -> ValidationRule {
        return CardExpiryYearRule()
    }
    
}
