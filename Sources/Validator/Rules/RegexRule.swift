//
//  RegexRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `RegexRule` is a subclass of Rule that defines how a regular expression is validated.
 */
open class RegexRule: ValidationRule {
    
    /// Regular express string to be used in validation.
    private var _regex: String = "^(?=.*?[A-Z]).{8,}$"
    
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
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    open override func validate(_ value: Any?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch ad {
        case let d as String:
            let test = NSPredicate(format: "SELF MATCHES %@", self._regex)
            if !test.evaluate(with: d) {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `RegexRule`
    public class func regex(pattern: String) -> ValidationRule {
        return RegexRule(regex: pattern)
    }
    
}
