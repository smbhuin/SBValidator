//
//  FloatRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `FloatRule` is a subclass of Rule that defines how check if a value is a floating point value.
 */
public class FloatRule: ValidationRule {
    
    /**
     Initializes a `FloatRule` object to validate that the text of a field is a floating point number.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "This must be a number with or without a decimal"){
        super.init(message: message)
    }
    
    /**
     Used to validate field.
     
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
            if let regex = try? NSRegularExpression(pattern: "^[-+]?(\\d*[.])?\\d+$", options: []) {
                let match = regex.numberOfMatches(in: d, options: [], range: NSRange(location: 0, length: d.count))
                if match != 1 {
                    return error
                }
            }
            else {
                fatalError("FloatRule: Failed to create Regex Expression")
            }
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `FloatRule`
    class var floatingPoint: ValidationRule {
        get  {
            return FloatRule()
        }
    }
    
}
