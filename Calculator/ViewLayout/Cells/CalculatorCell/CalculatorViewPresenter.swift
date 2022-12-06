//
//  CalculatorViewPresenter.swift
//  Calculator
//
//  Created by Bakai Ismailov on 29/11/22.
//

import UIKit
import SnapKit

protocol CalculatorViewPresenterDelegate: AnyObject {
    func showExpression(_ expression: String)
    func showResult(_ result: String)
}

class CalculatorViewPresenter {
    weak var delegate: CalculatorViewPresenterDelegate?
    
    private var mathString = ""
    
    func onOperation(_ type: KeyBoardButtonType) {
        switch type {
        case .operation(_, let operation):
            mathOperation(operation)
            
            break
        case .number(let number):
            mathNumber(number)
            
            break
        }
    }
    
    private func mathOperation(_ operation: OperationType) {
        if getCheckOperation() {
            mathString = mathString + " \(operation.symbol) "
        
            delegate?.showExpression(mathString)
        }
    }
    
    private func getCheckOperation() -> Bool {
        if mathString.count > 2 {
            let lastOperationSymbol = String(Array(mathString)[mathString.count - 2])
            
            return !OperationType.all.contains { item in return item.symbol == lastOperationSymbol }
        } else if mathString.count == 1 {
            return true
        } else {
            return false
        }
    }
    
    private func mathNumber(_ number: String) {
        mathString = mathString + number
        
        delegate?.showExpression(mathString)
    }
}
