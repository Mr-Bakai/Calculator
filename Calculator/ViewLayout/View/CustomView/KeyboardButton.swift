//
//  KeyboardButton.swift
//  Calculator
//
//  Created by Bakai Ismailov on 26/11/22.
//

import Foundation
import UIKit
import SnapKit

enum KeyBoardButtonType {
    case operation(image: UIImage?, operation: OperationType)
    case number(number: String)
}

enum OperationType {
    case clear(type: ClearType)
    
    case plus
    case minus
    case obelus
    case times
    case result
}

enum ClearType {
    case all
    case last
}

class KeyboardButton: BaseView {
    
    private lazy var image: UIImageBoxView = {
        let view = UIImageBoxView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .darkGray
        view.isHidden = true
        return view
    }()
    
    private lazy var label: UILabelView = {
        let view = UILabelView()
        view.font = UIFont.systemFont(ofSize: 30, weight: .light)
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 0
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.isHidden = true
        return view
    }()
    
    private var listener: (KeyBoardButtonType) -> Void = { _ in }
    private var type: KeyBoardButtonType? = nil
    
    init(type: KeyBoardButtonType, _ listener: @escaping (KeyBoardButtonType) -> Void) {
        super.init(frame: .zero)
        fill(type: type)
        setKeyboardListener(listener: listener)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubViews() {
        addSubview(image)
        image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(28)
        }
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    override func setupUI() {
        backgroundColor = .darkGray
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        setClickListener { [self] in
            if let type = type { listener(type) }
        }
    }
    
    func setKeyboardListener(listener: @escaping (KeyBoardButtonType) -> Void) {
        self.listener = listener
    }
    
    func fill(type: KeyBoardButtonType) {
        self.type = type
        
        switch type {
            
        case .operation(let image, let operation):
            operationFill(image, operation)
            break
            
        case .number(let number):
            numberFill(number)
            break
        }
    }
    
    private func operationFill(_ image: UIImage?, _ operation: OperationType) {
        self.image.isHidden = false
        self.image.image = image
    }
    
    private func numberFill(_ number: String) {
        self.label.isHidden = false
        self.label.text = number
    }
}
