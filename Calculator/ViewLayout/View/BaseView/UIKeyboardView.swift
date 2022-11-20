//
//  UIKeyboardView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 12/11/22.
//

import Foundation
import UIKit
import SnapKit

enum KeyBoardType {
    case number(title: String)
    case delete
    case exit
}

class UIKeyboardView: BaseView {
    
    //MARK: StackView
    private var numbersContainerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var firstSymbolStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var secondSymbolStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var firstNumbersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var secondNumbersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var thirdNumbersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    private var fourthNumbersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
        
    private lazy var backSpace: UIImageBoxView = {
        let view = UIImageBoxView(image: UIImage.backSpace)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var uiBackSpaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBlack
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    override func addSubViews() {
        addSubview(numbersContainerStackView)
        numbersContainerStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        firstSymbolStackView.addArrangedSubview(addSymbol("C", .lightBlack))
        firstSymbolStackView.addArrangedSubview(addSymbol("+/-", .lightBlack))
        firstSymbolStackView.addArrangedSubview(addSymbol("%", .lightBlack))
        firstSymbolStackView.addArrangedSubview(UIView())
        
        secondSymbolStackView.addArrangedSubview(addGreenSymbols(.plusSign))
        secondSymbolStackView.addArrangedSubview(addGreenSymbols(.minusSign))
        secondSymbolStackView.addArrangedSubview(addGreenSymbols(.multiplySign))
        secondSymbolStackView.addArrangedSubview(addGreenSymbols(.divisionSign))
        
        firstNumbersStackView.addArrangedSubview(addSymbol("7"))
        firstNumbersStackView.addArrangedSubview(addSymbol("8"))
        firstNumbersStackView.addArrangedSubview(addSymbol("9"))
        
        secondNumbersStackView.addArrangedSubview(addSymbol("4"))
        secondNumbersStackView.addArrangedSubview(addSymbol("5"))
        secondNumbersStackView.addArrangedSubview(addSymbol("6"))
        
        thirdNumbersStackView.addArrangedSubview(addSymbol("1"))
        thirdNumbersStackView.addArrangedSubview(addSymbol("2"))
        thirdNumbersStackView.addArrangedSubview(addSymbol("3"))
        
        fourthNumbersStackView.addArrangedSubview(addSymbol("0"))
        fourthNumbersStackView.addArrangedSubview(addSymbol(","))
        fourthNumbersStackView.addArrangedSubview(addGreenSymbols(.equalSign))
        
        uiBackSpaceView.addSubview(backSpace)
        backSpace.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        numbersContainerStackView.addArrangedSubview(firstSymbolStackView)
        numbersContainerStackView.addArrangedSubview(secondSymbolStackView)
        numbersContainerStackView.addArrangedSubview(firstNumbersStackView)
        numbersContainerStackView.addArrangedSubview(secondNumbersStackView)
        numbersContainerStackView.addArrangedSubview(thirdNumbersStackView)
        numbersContainerStackView.addArrangedSubview(fourthNumbersStackView)
    }
    
    private func addGreenSymbols(_ image: UIImage? = nil, _ color: UIColor? = .darkGray) -> UIView {
        let container = UIView()
        container.backgroundColor = .darkGray
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        
        let imageView: UIImageBoxView = {
            let view = UIImageBoxView(image: image)
            view.contentMode = .scaleAspectFit
            view.backgroundColor = .darkGray
            return view
        }()
        
        container.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        return container
    }
    
    private func addSymbol(_ symbol: String, _ color: UIColor? = .darkGray) -> UILabel {
        let label: UILabelView = {
            let view = UILabelView()
            view.setClickListener(labelClickListener)
            view.font = UIFont.systemFont(ofSize: 30, weight: .light)
            view.text = symbol
            view.textColor = .white
            view.textAlignment = .center
            view.numberOfLines = 0
            view.backgroundColor = color
            view.layer.cornerRadius = 5
            view.layer.masksToBounds = true
            return view
        }()
        return label
    }
    
    private lazy var labelClickListener: (UILabel) -> Void = { view in
        view.showClick()
        self.listener(.number(title: view.text ?? .empty))
    }
    
    private var listener: (KeyBoardType) -> Void = {_ in}
    
    func setKeyBoardListener(_ listener: @escaping (KeyBoardType) -> Void) {
        self.listener = listener
    }
    
    override func setupUI() {
        backSpace.setClickListener {
            self.backSpace.showClick()
        }
    }
}
