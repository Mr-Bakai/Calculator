//
//  UIOperationsCollectionView.swift
//  Calculator
//
//  Created by Bakai Ismailov on 3/11/22.
//

import Foundation
import UIKit
import SnapKit

class UIOperationsCollectionView: UICollectionView {
    
    private var customViews: [BaseView] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)

        isPagingEnabled = true
        backgroundColor = .clear
        dataSource = self
        delegate = self
        
        register(ConverterCollectionViewCell.self, forCellWithReuseIdentifier: ConverterCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollToIndex(_ index: Int) {
        scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func setViewsForCell(_ views: [BaseView]){
        self.customViews = views
        self.reloadData()
    }
}

extension UIOperationsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConverterCollectionViewCell.identifier, for: indexPath) as! ConverterCollectionViewCell
        let view = customViews[indexPath.row]
        cell.configureWith(view)
        return cell
    }
}
