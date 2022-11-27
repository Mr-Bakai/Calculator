//
//  GridLayout.swift
//  Calculator
//
//  Created by Bakai Ismailov on 26/11/22.
//

import Foundation
import UIKit
import SnapKit

class GridLayout: UIStackView {
    
    private var maxItemInLine: Int
    private var container: UIStackView?
    
    init(maxItemInLine: Int) {
        self.maxItemInLine = maxItemInLine

        super.init(frame: .zero)
                
        axis = .vertical
        distribution = .fillEqually
        spacing = 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView(_ view: UIView) {
        if container == nil {
            container = createContainer()
            container?.addArrangedSubview(view)
            addArrangedSubview(container!)
            
        } else if (container?.subviews.count ?? 0) >= maxItemInLine {
            container = nil
            addView(view)
        } else {
            container?.addArrangedSubview(view)
        }
    }
    
    private func createContainer() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }
}
