//
//  FullNameRule.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

/**
 `FullNameRule` is a subclass of `ValidationRule` that defines how a full name is validated.
 */
public class FullNameRule : ValidationRule<String> {
    
    /**
     Initializes a `FullNameRule` object that is used to verify that text in field is a full name.
     
     - parameter message: String of error message.
     - returns: An initialized `FullNameRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public override init(message: String = "is not a valid full name.") {
        super.init(message: message)
    }
    
    /**
     Used to validate a name String.
     
     - parameter value: String to be checked for validation.
     - returns: Error Message. nil if validation is successful; `String` if validation fails.
     */
    public override func validate(_ value: String?) -> String? {
        guard let v = value, !v.isEmpty else { return nil }
        let nameArray: [String] = v.split { $0 == " " }.map { String($0) }
        if nameArray.count < 2 {
            return self.message
        }
        return nil
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `FullNameRule`
    class var fullName: ValidationRule<String> {
        get  {
            return FullNameRule()
        }
    }
    
}

