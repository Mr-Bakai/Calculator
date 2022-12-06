//
//  OperationsCollectionViewCell.swift
//  Calculator
//
//  Created by Bakai Ismailov on 3/11/22.
//

import UIKit
import SnapKit

class OperationsCollectionViewCell: UICollectionViewCell {
    static let identifier = "MainCollectionViewCell"
   
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureWith(_ view: BaseView){
        addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
