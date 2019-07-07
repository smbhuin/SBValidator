//
//  CoordinateRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 07/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `CoordinateRule` is a subclass of ValidationRule that defines how check if a value is a latitude or longitude value.
 */
public class CoordinateRule: ValidationRule {
    
    /**
     Initializes a `CoordinateRule` object to validate that provided value is valid lat or long coordinate.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "This must be a coordinate number"){
        super.init(message: message)
    }
    
    /**
     Used to validate Coordinate value.
     
     - parameter value: String to be checked for validation.
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
                fatalError("CoordinateRule: Failed to create Regex Expression")
            }
        case _ as Double:
            return nil
        default:
            return ValidationError.inapplicable()
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `CoordinateRule`
    public class var coordinate: ValidationRule {
        get  {
            return CoordinateRule()
        }
    }
    
}
