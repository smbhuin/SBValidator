//
//  RegexRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `RegexRule` is a subclass of `ValidationRule` that defines how a regular expression is validated.
 */
open class RegexRule: ValidationRule<String> {
    
    /// Regular express string to be used in validation.
    private var _regex: String = ""
    
    /**
     Method used to initialize `RegexRule` object.
     
     - parameter regex: Regular expression string to be used in validation.
     - parameter message: String of error message.
     - returns: An initialized `RegexRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(regex: String, message: String = "is invalid"){
        self._regex = regex
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: String to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    open override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        guard let regex = try? NSRegularExpression(pattern: self._regex, options: []) else {
            fatalError("RegexRule: Failed to create Regex Expression")
        }
        let match = regex.numberOfMatches(in: v, options: [], range: NSRange(location: 0, length: v.count))
        if match != 1 {
            return self.message
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RegexRule`
    class func regex(pattern: String) -> ValidationRule<String> {
        return RegexRule(regex: pattern)
    }
    
}
