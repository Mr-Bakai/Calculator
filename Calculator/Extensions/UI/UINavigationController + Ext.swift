//
//  UINavigationController + Ext.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    enum ViewControllerPosition { case first, last }
    enum ViewControllersGroupPosition { case first, last, all }

    func removeController(_ position: ViewControllerPosition, animated: Bool = true,
                          where closure: (UIViewController) -> Bool) {
        var index: Int?
        switch position {
            case .first: index = viewControllers.firstIndex(where: closure)
            case .last: index = viewControllers.lastIndex(where: closure)
        }
        if let index = index { removeControllers(animated: animated, in: Range(index...index)) }
    }
    
    func removeController(_ position: ViewControllerPosition, animated: Bool = true) {
        var index: Int?
        switch position {
            case .first: index = viewControllers.firstIndex(where: {_ in true})
            case .last: index = viewControllers.lastIndex(where: {_ in true})
        }
        if let index = index { removeControllers(animated: animated, in: Range(index...index)) }
    }

    func removeControllers(_ position: ViewControllersGroupPosition, animated: Bool = true,
                           where closure: (UIViewController) -> Bool) {
        var range: Range<Int>?
        switch position {
            case .first: range = viewControllers.firstRange(where: closure)
            case .last:
                guard let _range = viewControllers.reversed().firstRange(where: closure) else { return }
                let count = viewControllers.count - 1
                range = .init(uncheckedBounds: (lower: count - _range.min()!, upper: count - _range.max()!))
            case .all:
                let viewControllers = self.viewControllers.filter { !closure($0) }
                setViewControllers(viewControllers, animated: animated)
                return
        }
        if let range = range { removeControllers(animated: animated, in: range) }
    }

    func removeControllers(animated: Bool = true, in range: Range<Int>) {
        var viewControllers = self.viewControllers
        viewControllers.removeSubrange(range)
        setViewControllers(viewControllers, animated: animated)
    }

    func removeControllers(animated: Bool = true, in range: ClosedRange<Int>) {
        removeControllers(animated: animated, in: Range(range))
    }
    
    func removeAllControllers(animated: Bool = true) {
        removeControllers(.all, animated: animated) { _ in true }
    }
}
