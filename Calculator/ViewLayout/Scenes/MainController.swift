//
//  MainController.swift
//  Calculator
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import UIKit
import SnapKit

class MainController: BaseController {
    
    private let converterView = BaseView()
    
    private let calculatorView = CalculatorView()
    
    private let toolbar = UICustomToolbarView()
    private let segmentView = UICustomSegmentView()
    private let collection = OperationsCollectionView()
    
    override func setupSubViews() {
        view.addSubview(toolbar)
        toolbar.snp.makeConstraints { make in
            make.top.equalTo(view.safeArea.top)
            make.left.right.equalToSuperview()
        }
        
        view.addSubview(segmentView)
        segmentView.snp.makeConstraints { make in
            make.top.equalTo(toolbar.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(8)
        }
        
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.top.equalTo(segmentView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
    
    override func setupUI() {
        view.backgroundColor = .backgroundColor
        
        collection.setViewsForCell([converterView, calculatorView])
        
        toolbar.fill(title: "Calculator")
        
        segmentView.addItem("Converter")
        segmentView.addItem("Calculator")
        
        segmentView.setSwipeListener { [self] index in
            collection.scrollToIndex(index)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        segmentView.defaultPointAt(index: 1)
    }
}
