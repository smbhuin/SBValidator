//
//  ValidatableRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 17/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `ValidatableRule` is a subclass of `ValidationRule` that defines how a object which conforms to `Validatable` protocol is validated.
 */
public class ValidatableRule<V>: ValidationRule<V> where V : Validatable {
    
    public override init(message: String = "") {
        super.init(message: message)
    }
    
    /**
     Method used to validate the provided value.
     
     - parameter value: Any value to checked for validation.
     - returns: `String`. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: V?) -> String? {
        guard let v = value else { return nil }
        if let e = v.validate() {
            if self.message == "" {
                return e.description
            }
            else {
                return self.message
            }
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `ValidatableRule`
    class func validatable<V>() -> ValidationRule<V> where V : Validatable {
        return ValidatableRule<V>()
    }
    
}

