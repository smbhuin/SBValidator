//
//  ExactLengthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ExactLengthRule` is a subclass of `ValidationRule` that is used to make sure a the value has an exact length.
 */
public class ExactLengthRule : ValidationRule<String> {
    
    /// parameter length: Integer value string length
    private var length : Int
    
    /**
     Initializes an `ExactLengthRule` object to validate the text of a field against an exact length.
     
     - parameter length: Integer value of exact string length being specified.
     - parameter message: String of error message.
     - returns: An initialized `ExactLengthRule` object, or nil if an object could not be created for some reason. that would not result in an exception.
     */
    public init(length: Int, message: String = ""){
        self.length = length
        super.init(message: message == "" ? "must be exactly \(length) characters/count in length" : message)
    }
    
    /**
     Used to validate length of string.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        if v.count == length {
            return nil
        }
        return self.message
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ExactLengthRule`
    class func exactLength(_ length: Int) -> ValidationRule<String> {
        return ExactLengthRule(length: length)
    }
    
}
