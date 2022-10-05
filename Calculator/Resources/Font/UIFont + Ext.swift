//
//  UIFont + Ext.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

// MARK: Font Assets

enum Segoe: String {
    case `default` = "Segoe UI"
    case bold = "SegoeUI-Bold"
    case madium = "SegoeUI-SemiBold"
}

extension UIFont {
    convenience init?(type: Segoe, size: CGFloat) {
        self.init(name: type.rawValue, size: size)
    }
}
