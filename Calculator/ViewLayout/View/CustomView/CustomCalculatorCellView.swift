//
//  CustomCalculatorCellView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

class CustomCalculatorCellView: BaseView {
    
    private let calculatedView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let keyboardView = UIKeyboardView()
    
    override func addSubViews() {
        addSubview(calculatedView)
        calculatedView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.4)
        }
        
        addSubview(keyboardView)
        keyboardView.snp.makeConstraints { make in
            make.top.equalTo(calculatedView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
