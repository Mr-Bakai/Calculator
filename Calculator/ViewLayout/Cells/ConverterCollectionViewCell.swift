//
//  ConverterTableViewCell.swift
//  Calculator
//
//  Created by Bakai Ismailov on 3/11/22.
//

import Foundation
import UIKit
import SnapKit

class ConverterCollectionViewCell: UICollectionViewCell {
    static let identifier = "ConverterCollectionViewCell"
   
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
