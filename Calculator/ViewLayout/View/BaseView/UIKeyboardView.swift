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
    
    // MARK: -Symbols
    private lazy var clearLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "C"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .lightBlack
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var plusMinusLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "+/-"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .lightBlack
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var percentLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "%"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .lightBlack
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var plusLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "+"
        view.textColor = .greenSymbol
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var plusSignImage: UIImageBoxView = {
        let view = UIImageBoxView(image: UIImage.plusSign)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var minusLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "-"
        view.textColor = .greenSymbol
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var multiplyLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "x"
        view.textColor = .greenSymbol
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var divisionLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "/"
        view.textColor = .greenSymbol
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: -NumberViews
    private lazy var numberOneLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "1"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberTwoLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "2"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberThreeLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.textAlignment = .center
        view.text = "3"
        view.textColor = .white
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private  lazy var numberFourLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.textAlignment = .center
        view.text = "4"
        view.textColor = .white
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberFiveLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "5"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberSixLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "6"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private  lazy var numberSevenLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "7"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberEightLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "8"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var numberNineLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "9"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private  lazy var numberZeroLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "0"
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var commaLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = ","
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var equalLabel: UILabelView = {
        let view = UILabelView()
        view.setClickListener(labelClickListener)
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.text = "="
        view.textColor = .greenSymbol
        view.textAlignment = .center
        view.numberOfLines = 0
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var uiSpaceView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backSpace: UIImageBoxView = {
        let view = UIImageBoxView(image: UIImage.backSpace)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var uiBackSpaceView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightBlack
        return view
    }()
    
    private lazy var labelClickListener: (UILabel) -> Void = { view in
        view.showClick()
        self.listener(.number(title: view.text ?? .empty))
    }
    
    override func addSubViews() {
        addSubview(numbersContainerStackView)
        numbersContainerStackView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        firstSymbolStackView.addArrangedSubview(clearLabel)
        firstSymbolStackView.addArrangedSubview(plusMinusLabel)
        firstSymbolStackView.addArrangedSubview(percentLabel)
        firstSymbolStackView.addArrangedSubview(uiBackSpaceView)
        
        secondSymbolStackView.addArrangedSubview(plusSignImage)
        secondSymbolStackView.addArrangedSubview(minusLabel)
        secondSymbolStackView.addArrangedSubview(multiplyLabel)
        secondSymbolStackView.addArrangedSubview(divisionLabel)
        
        firstNumbersStackView.addArrangedSubview(numberSevenLabel)
        firstNumbersStackView.addArrangedSubview(numberEightLabel)
        firstNumbersStackView.addArrangedSubview(numberNineLabel)
        
        secondNumbersStackView.addArrangedSubview(numberFourLabel)
        secondNumbersStackView.addArrangedSubview(numberFiveLabel)
        secondNumbersStackView.addArrangedSubview(numberSixLabel)
        
        thirdNumbersStackView.addArrangedSubview(numberOneLabel)
        thirdNumbersStackView.addArrangedSubview(numberTwoLabel)
        thirdNumbersStackView.addArrangedSubview(numberThreeLabel)
        
        fourthNumbersStackView.addArrangedSubview(numberZeroLabel)
        fourthNumbersStackView.addArrangedSubview(commaLabel)
        fourthNumbersStackView.addArrangedSubview(equalLabel)
        
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
