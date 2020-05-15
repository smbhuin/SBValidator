//
//  HexColorRule.swift
//  SBValidator
//
//  Created by Soumen Bhuin on 25/06/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import Foundation

/**
 `HexColorRule` is a subclass of `RegexRule`. It is used to verify whether a field is a hexadecimal color.
 */
public class HexColorRule : RegexRule {
    
    /// Regular expression string that is used to verify hexadecimal
    static let regex = "^#?([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$"

    /**
     Initializes a `HexaColorRule` object to verify that field has text in hexadecimal color format.
     
     - parameter message: String of error message.
     - returns: An initialized object.
     */
    public init(message: String = "is not a valid hex color.") {
        super.init(regex: HexColorRule.regex, message: message)
    }
    
}

public extension ValidationRule {
    
    /// Quick accessor for `HexColorRule`
    class var hexColor: ValidationRule<String> {
        return HexColorRule()
    }
    
}
