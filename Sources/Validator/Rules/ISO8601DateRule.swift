//
//  ISO8601DateRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 16/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ISO8601DateRule` is a subclass of `ValidationRule` that means value can't be nil or blank. Make sure required rule is the first item in rules list
 */
@available(OSX 10.12, *)
public class ISO8601DateRule: ValidationRule<String> {
    
    /// ISO8601Date Options
    private var options: ISO8601DateFormatter.Options
    
    /**
     Initializes a `ISO8601DateRule` object that will validate a value is not nil.
     
     - parameter message: String of error message.
     - returns: An initialized `ISO8601DateRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(options: ISO8601DateFormatter.Options, message: String = "is invalid") {
        self.options = options
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails. Returns error for empty string or collection
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        let df = ISO8601DateFormatter()
        if !options.isEmpty {
            df.formatOptions = options
        }
        if let _ = df.date(from: v) {
            return nil
        }
        return self.message
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ISO8601DateRule`
    @available(OSX 10.12, *)
    class func iso8601date(options: ISO8601DateFormatter.Options = []) -> ValidationRule<String> {
        return ISO8601DateRule(options: options)
    }
    
}
