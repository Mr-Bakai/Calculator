//
//  Animation + Ext.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import SnapKit
import UIKit


extension UIView {
    func showHidden(hidden: Bool, withDuration: Double = 0.3, completion: @escaping () -> Void = {}) {
        if hidden {
            UIView.animate(withDuration: withDuration, animations: {
                self.alpha = 0
            }) { (finished) in
                self.isHidden = finished
                
                completion()
            }
        } else {
            self.alpha = 1
            
            UIView.transition(with: self, duration: withDuration, options: .transitionCrossDissolve, animations: {
                self.isHidden = hidden
            }) { finished in
                completion()
            }
        }
    }
    
    func changeColorAnimation(withDuration: Double = 0.3, _ color: UIColor?) {
        UIView.animate(withDuration: withDuration) {
            self.backgroundColor = color
        }
    }
    
    
    func showClick() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        })
    }
}
