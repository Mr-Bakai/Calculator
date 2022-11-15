//
//  UIViewPager.swift
//  Calculator
//
//  Created by Bakai Ismailov on 8/10/22.
//

import UIKit
import SnapKit

class UICustomSegmentView: BaseView {
    
    private var counter = 0
    private let recognizer = UISegmentViewRecognizer()
    
    private let indicator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 7
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private var labels: [UILabel] = []
    
    override func setupUI() {
        layer.cornerRadius = 7
        backgroundColor = .viewPagerBackground
    }
    
    override func addSubViews() {
        addSubview(indicator)
        addSubview(stackView)
        
        indicator.snp.makeConstraints { make in
            make.top.bottom.equalTo(stackView)
            make.left.right.equalToSuperview().dividedBy(counter)
        }
        
        stackView.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.edges.equalToSuperview()
        }
        
        stackView.addGestureRecognizer(recognizer)
        recognizer.viewComponent = stackView
        recognizer.viewMoved = indicator
        recognizer.setSwipeListener(swipeListener)
    }
    
    func addItem(_  title: String) {
        counter = counter + 1
        
        let containerViewItem = UIView()
        let titleLabel: UILabel = {
            let view = UILabel()
            view.textColor = .white
            view.text = title
            view.textAlignment = .center
            return view
        }()
        
        stackView.addArrangedSubview(containerViewItem)
        
        containerViewItem.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        labels.append(titleLabel)
        recognizer.labels = labels
    }
    
    /// TODO: To be fixed, figure out at what time you can get the width of indicator
    func defaultPointAt(index: Int){
        let startX = indicator.frame.width * CGFloat(index)
        UIView.animate(withDuration: 0.2) { [self] in
            indicator.transform = CGAffineTransform(translationX: startX, y: 0)
        }
    }
    
    private var swipeListener: (Int) -> Void = { _ in }
    
    func setSwipeListener(_ swipeListener: @escaping (Int) -> Void) {
        self.swipeListener = swipeListener
    }
}

private class UISegmentViewRecognizer: UIPanGestureRecognizer {
    
    var viewMoved: UIView? = nil
    var viewComponent: UIView? = nil
    var defaultPosition: Int = 0
    
    var labels: [UILabel] = []
    
    init() {
        super.init(target: nil, action: nil)
    }
    
    private var swipeListener: (Int) -> Void = { _ in }
    
    func setSwipeListener(_ swipeListener: @escaping (Int) -> Void) {
        self.swipeListener = swipeListener
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        restrictAtFrame(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        gravitateIndicator()
    }
    
    private func restrictAtFrame(_ touches: Set<UITouch>) {
        let touch = touches.first
        
        if let touch = touch {
            let loc = touch.location(in: self.view?.superview ?? UIView())
            let oldP = touch.previousLocation(in: self.view?.superview ?? UIView())
            let deltaX = loc.x - oldP.x
            
            let leftXMoveMaxPoint = (viewMoved?.frame.origin.x ?? 0) + deltaX + (viewMoved?.frame.width ?? 0)
            let leftXMaxPoint = viewComponent?.frame.width ?? 0
            
            let rightXMoveMaxPoint = (viewMoved?.frame.origin.x ?? 0) + deltaX
            let rightXMaxPoint = CGFloat(0)
            
            if leftXMoveMaxPoint > leftXMaxPoint {
                return
            }
            
            if rightXMoveMaxPoint < rightXMaxPoint {
                return
            }
            
            UIView.animate(withDuration: 0.1) { [self] in
                viewMoved?.transform = CGAffineTransform(translationX: deltaX + (viewMoved?.transform.tx ?? 0), y: 0)
            }
        }
    }
    
    private func gravitateIndicator() {
        let centerMove = ((viewMoved?.frame.width ?? 0.0) / 2.0) + (viewMoved?.frame.origin.x ?? 0.0)
        
        for (index, item) in labels.enumerated() {
            let startX = item.frame.width * CGFloat(index)
            let endX = startX + item.frame.width
            
            if centerMove > startX && centerMove < endX {
                UIView.animate(withDuration: 0.2) { [self] in
                    viewMoved?.transform = CGAffineTransform(translationX: startX, y: 0)
                    
                    swipeListener(index)
                }
            }
        }
    }
}
