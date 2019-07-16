//
//  ExactLengthRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `ExactLengthRule` is a subclass of `ValidationRule` that is used to make sure a the text of a field is an exact length.
 */
public class ExactLengthRule<Value> : ValidationRule<Value> where Value : Collection {
    
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
        super.init(message: message == "" ? String(format: "must be exactly %ld characters/count in length", self.length) : message)
    }
    
    /**
     Used to validate lenght of string or count of countable objects.
     
     - parameter value: Any value to be checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Value?) -> ValidationError? {
        guard let v = value else { return nil }
        if v.count == length {
            return nil
        }
        return ValidationError(self.message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ExactLengthRule`
    class func exactLength<Value>(_ length: Int) -> ValidationRule<Value> where Value : Collection {
        return ExactLengthRule<Value>(length: length)
    }
    
}
