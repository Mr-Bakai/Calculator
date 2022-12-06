//
//  UIKeyboardView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

class UIKeyboardView: BaseView {
    // qweqwe: ImageStack add 2 images
    private let imageStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        return view
    }()
    
    private lazy var gridLayout = GridLayout(maxItemInLine: 4)
    
    private var listener: (KeyBoardButtonType) -> Void = { _ in }

    override func addSubViews() {
        addSubview(gridLayout)
        gridLayout.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        setupButtons()
    }
    
    private func setupButtons() {
        setupFirstLine()
        setupSecondLine()
        setupThirdLine()
        setupFourthLine()
    }
    
    private func setupFirstLine() {
        gridLayout.addView(KeyboardButton(type: .number(number: "7"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "8"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "9"), listener))
        gridLayout.addView(KeyboardButton(type: .operation(image: .plusSign, operation: .plus), listener))
    }
    
    private func setupSecondLine() {
        gridLayout.addView(KeyboardButton(type: .number(number: "4"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "5"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "6"), listener))
        gridLayout.addView(KeyboardButton(type: .operation(image: .minusSign, operation: .minus), listener))
    }
    
    private func setupThirdLine() {
        gridLayout.addView(KeyboardButton(type: .number(number: "1"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "2"), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "3"), listener))
        gridLayout.addView(KeyboardButton(type: .operation(image: .multiplySign, operation: .obelus), listener))
    }
    
    private func setupFourthLine() {
        gridLayout.addView(KeyboardButton(type: .number(number: ","), listener))
        gridLayout.addView(KeyboardButton(type: .number(number: "0"), listener))
        gridLayout.addView(KeyboardButton(type: .operation(image: .divisionSign, operation: .times), listener))
        gridLayout.addView(KeyboardButton(type: .operation(image: .equalSign, operation: .result), listener))
    }
    
    func setKeyboardListener(listener: @escaping (KeyBoardButtonType) -> Void) {
        self.listener = listener
    }
}
