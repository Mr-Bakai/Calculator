//
//  String + Ext.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

extension String {
    
    static var empty: String { return "" }
    
    static var newLine: String { return "\n" }
    
    static func whitespace(count: Int = 1) -> String {
        return String(repeating: " ", count: count)
    }
    
    var isContainLatin: Bool {
        let upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lower = "abcdefghijklmnopqrstuvwxyz"
        
        for c in self.map({ String($0) }) {
            if upper.contains(c) || lower.contains(c) {
                return true
            }
        }
        
        return false
    }
    
    var isContainNumber: Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let containsNumber = testCase.evaluate(with: self)

        return containsNumber
    }
}
