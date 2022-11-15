//
//  UIImageBoxView.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 10.10.2022.
//

import Foundation
import UIKit

class UIImageBoxView: UIImageView {
    private lazy var listener: () -> Void = {}
    
    func setClickListener(_ listener: @escaping () -> Void) {
        self.listener = listener
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        listener()
    }
}

extension UIImageBoxView {
    func changeImageWithAnimation(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.3 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
}
