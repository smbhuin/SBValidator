//
//  FullNameRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `FullNameRule` is a subclass of Rule that defines how a full name is validated.
 */
public class FullNameRule: ValidationRule {
    
    /**
     Initializes a `FullNameRule` object that is used to verify that text in field is a full name.
     
     - parameter message: String of error message.
     - returns: An initialized `FullNameRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "Please provide a first & last name") {
        super.init(message: message)
    }
    
    /**
     Used to validate a field.
     
     - parameter value: String to checked for validation.
     - returns: `ValidationError`. nil if validation is successful; `ValidationError` if validation fails.
     */
    public override func validate(_ value: Any?) -> ValidationError? {
        guard let ad = value
            else  {
                return nil
        }
        let error = ValidationError(self.message)
        switch ad {
        case let d as String:
            let nameArray: [String] = d.split { $0 == " " }.map { String($0) }
            if nameArray.count < 2 {
                return error
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `FullNameRule`
    public class var fullName: ValidationRule {
        get  {
            return FullNameRule()
        }
    }
    
}

