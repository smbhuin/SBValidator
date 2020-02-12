//
//  ConfirmRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ConfirmRule` is a subclass of `ValidationRule` that defines how a value that has to be equal
 to another value is validated.
 */
public class ConfirmRule<V> : ValidationRule<V> where V : Equatable {
    
    /// value to which original text field will be compared to.
    private let confirmValue: V
    
    /**
     Initializes a `ConfirmationRule` object to validate the value that should equal the value to be validated.
     
     - parameter confirmValue: field to which original field will be compared to.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(confirmValue: V, message: String = "does not match with desired value."){
        self.confirmValue = confirmValue
        super.init(message: message)
    }
    
    /**
     Used to validate a value.
     
     - parameter value: Any value to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: V?) -> String? {
        guard let ad = value else { return nil }
        if ad == confirmValue {
            return nil
        }
        else {
            return self.message
        }
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ConfirmRule`
    class func confirm<V>(_ value: V) -> ValidationRule<V> where V : Equatable {
        return ConfirmRule(confirmValue: value)
    }
    
}
