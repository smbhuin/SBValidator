//
//  EmailRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `EmailRule` is a subclass of RegexRule that defines how a email is validated.
 */
public class EmailRule : RegexRule {
    
    /// Regular expression string to be used in validation.
    static let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
    
    /**
     Initializes an `EmailRule` object to validate an email field.
     
     - parameter message: String of error message.
     - returns: An initialized object.
     */
    public init(message: String = "is invalid."){
        super.init(regex: EmailRule.regex, message: message)
    }
    
    /*public override func validate(_ value: String?) -> String? {
        if let error = super.validate(value) {
            return error
        }
        
        if let coms = value?.components(separatedBy: "@") {
            for cs in coms {
                let scoms = cs.components(separatedBy: ".")
                for c in scoms {
                    if c.isEmpty || c.hasPrefix("-") || c.hasSuffix("-") {
                        return self.message
                    }
                }
            }
        }
        
        return nil
    }*/
    
}

public extension ValidationRule {
    
    /// Quick accessor for `EmailRule`
    class var email: ValidationRule<String> {
        return EmailRule()
    }
    
}
