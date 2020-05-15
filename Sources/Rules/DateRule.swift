//
//  DateRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 16/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `DateRule` is a subclass of `ValidationRule` that means value can't be nil or blank. Make sure required rule is the first item in rules list
 */
public class DateRule: ValidationRule<String> {
    
    /// Date format
    private var format: String
    
    /**
     Initializes a `DateRule` object that will validate a value is not nil.
     
     - parameter message: String of error message.
     - returns: An initialized `DateRule` object.
     */
    public init(format: String, message: String = "is invalid.") {
        self.format = format
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails. Returns error for empty string or collection
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        let df = DateFormatter()
        df.dateFormat = format
        if let _ = df.date(from: v) {
            return nil
        }
        return self.message
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `DateRule`
    class func date(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> ValidationRule<String> {
        return DateRule(format: format)
    }
    
}
