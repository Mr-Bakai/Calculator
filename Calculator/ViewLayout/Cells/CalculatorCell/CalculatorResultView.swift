//
//  CalculatorResultView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 3/12/22.
//

import Foundation
import SnapKit
import UIKit

class CalculatorResultView: BaseView {
    
    private var resultLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 45)
        view.text = "2073"
        view.textAlignment = .right
        view.textColor = .pureWhite
        return view
    }()
    
    private var expressionLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 30)
        view.textColor = .pureWhite
        view.textAlignment = .right
        return view
    }()
    
    override func addSubViews() {
        addSubview(resultLabel)
        resultLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        addSubview(expressionLabel)
        expressionLabel.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(8)
            make.bottom.equalTo(resultLabel.snp.top).offset(-8)
        }
    }
    
    override func setupUI() {
       
    }
    
    func pass(expression s: String) {
        expressionLabel.text = s
    }
    
    func pass(result s: String) {
        resultLabel.text = s
    }
}

// qweqwe: Font size in not applicable with convenience init
