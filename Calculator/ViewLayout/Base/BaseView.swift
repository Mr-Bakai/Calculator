//
//  BaseView.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    var isLoaded = false
    var isSetupConfig = false
    
    private var clickListener: () -> Void = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    private func configure() {
        if !isLoaded {
            isLoaded = true
            
            addSubViews()
            setupUI()
            onViewLoaded()
        }
    }
    
    func setClickListener(_ clickListener: @escaping () -> Void) {
        self.clickListener = clickListener
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        addGestureRecognizer(gesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        clickListener()
    }
    
    open func onViewLoaded() {}
    
    open func addSubViews() {}
    
    open func setupUI() {}
}
