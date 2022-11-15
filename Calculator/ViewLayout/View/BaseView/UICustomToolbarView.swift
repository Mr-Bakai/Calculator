//
//  UICustomToolbarView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 8/10/22.
//

import SnapKit
import UIKit

class UICustomToolbarView: BaseView {
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(type: .madium, size: 30)
        view.textColor = .toolbarTitleColor
        return view
    }()
    
    private lazy var rightImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(title: String, rightImage: UIImage? = nil) {
        self.titleLabel.text = title
        self.rightImage.image = rightImage
    }
    
    override func addSubViews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        addSubview(rightImage)
        rightImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-6)
            make.top.bottom.equalToSuperview()
        }
        
        snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    override func setupUI() {
        
    }
}
