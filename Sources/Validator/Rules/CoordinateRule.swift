//
//  CoordinateRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 07/07/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `CoordinateRule` is a subclass of ValidationRule that defines how check if a value is a latitude or longitude value. Value must be array of string or double. longitude should be first element.
 */
public class CoordinateRule: ValidationRule<[Double]> {
    
    /**
     Initializes a `CoordinateRule` object to validate that provided value is valid lat or long coordinate.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "is not a valid geo coordinate.") {
        super.init(message: message)
    }
    
    /**
     Used to validate Coordinate value.
     
     - parameter value: Array of Double to be checked for validation. longitude should be first element.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: [Double]?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        if v.count == 2 {
            let long = v[0]
            let lat = v[1]
            if long >= -180.0 && long <= 180.0 && lat >= -90.0 && lat <= 90.0 {
                return nil
            }
        }
        return self.message
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `CoordinateRule`
    class var coordinate: ValidationRule<[Double]> {
        get  {
            return CoordinateRule()
        }
    }
    
}
