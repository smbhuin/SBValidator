//
//  Validatable.swift
//  Validator
//
//  Created by Soumen Bhuin on 26/06/19.
//  Copyright © 2019 SMB. All rights reserved.
//

import Foundation

open class Validatable {
    
    public var name: String
    public var value: Any?
    public var rules: [ValidationRule]
    public var message: String?
    
    public init(name: String, value: Any?, rules: [ValidationRule], message: String? = nil) {
        self.name = name
        self.value = value
        self.rules = rules
        self.message = message
    }
    
    public func validate() -> ValidationError? {
        for rule in rules {
            if let error = rule.validate(value) {
                return error
            }
        }
        return nil
    }
    
}
