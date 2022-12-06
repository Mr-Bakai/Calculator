//
//  CalculatorView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

class CalculatorView: BaseView {
    
    private let resultView = CalculatorResultView()
    private var keyboardView = UIKeyboardView()
    
    private(set) lazy var presenter: CalculatorViewPresenter = {
        let presenter = CalculatorViewPresenter()
        presenter.delegate = self
        return presenter
    }()
    
    override func addSubViews() {
        addSubview(resultView)
        resultView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2.4)
        }
        
        addSubview(keyboardView)
        keyboardView.snp.makeConstraints { make in
            make.top.equalTo(resultView.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func setupUI() {
        
        keyboardView.setKeyboardListener { [weak self] type in
            guard let `self` = self else {
                return
            }
            self.presenter.onOperation(type)
        }
    }
}

extension CalculatorView: CalculatorViewPresenterDelegate {
    func showExpression(_ expression: String) {
        resultView.pass(expression: expression)
    }
    
    func showResult(_ result: String) {
        resultView.pass(result: result)
    }
}
