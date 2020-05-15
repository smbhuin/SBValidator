//
//  YearExpiryRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `YearExpiryRule` is a subclass of `ValidationRule` that defines how a credit/debit card's expiry year is validated
 */
public class YearExpiryRule : ValidationRule<String> {
    
    /// Default maximum validity period. Change to preferred value
    private var validity: Int!

    /**
     Initializes `YearExpiryRule` object with error message. Used to validate a card's expiry year.
     
     - parameter message: Error message string.
     - returns: An initialized `YearExpiryRule` object.
     */
    public init(validity: Int = 3, message: String = "") {
        self.validity = validity
        super.init(message: message == "" ? "must be within \(validity) years of validity.": message)
    }

    /**
     Validates a field.
     
     - parameter value: String or Int to check for validation.
     - returns: Error Message. nil on successful validation, otherwise `String` on failed Validation.
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        let error = self.message
        guard let year = Int(v) else {
            return error
        }
        // Holds the current year
        let thisYear = Calendar.current.component(Calendar.Component.year, from: Date())
        if thisYear > (year + validity) {
            return error
        }
        return nil
    }

}

public extension ValidationRule {
    
    /// Quick accessor for `YearExpiryRule`
    class func yearExpiry(validity: Int = 3) -> ValidationRule<String> {
        return YearExpiryRule(validity: validity)
    }
    
}
