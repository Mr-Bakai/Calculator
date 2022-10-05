//
//  NSMutableAttributedString + Ext .swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func setColorForText(_ textToFind: String?, with color: UIColor?) {
        let range: NSRange?
        
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        if let range = range {
            if range.location != NSNotFound {
                addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            }
        }
    }
    
    func setTypeText(_ textToFind: String?, with font: UIFont?) {
        let range: NSRange?
        
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        if let range = range {
            if range.location != NSNotFound {
                addAttribute(NSAttributedString.Key.font, value: font, range: range)
            }
        }
    }
}
