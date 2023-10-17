//
//  String+Ext.swift
//  MVVM_SOLID
//
//  Created by Tahir Anil Oghan on 17.10.2023.
//

import Foundation

extension String {
    
    /// This function checks the String value to returns a boolean depending if it pass or fail according to give regex.
    ///
    /// - Parameters:
    ///   - regex: Preferred regular expression to validate if the String value is indeed an email.
    func validate(regex: NSRegularExpression) -> Bool {
        return (regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil) ? true : false
    }
}
