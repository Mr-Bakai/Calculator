//
//  UILabelView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

class UILabelView: UILabel {
    
    private lazy var listener: () -> Void = {}
    private lazy var viewListener: (UILabel) -> Void = {_ in }

    func setClickListener(_ listener: @escaping () -> Void) {
        self.listener = listener
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
    
    func setClickListener(_ listener: @escaping (UILabel) -> Void) {
        self.viewListener = listener
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapViewFunction))
        isUserInteractionEnabled = true
        addGestureRecognizer(tap)
    }
    
    @objc func tapFunction(sender: UITapGestureRecognizer) {
        listener()
    }
    
    @objc func tapViewFunction(sender: UITapGestureRecognizer) {
        viewListener(self)
    }
}
