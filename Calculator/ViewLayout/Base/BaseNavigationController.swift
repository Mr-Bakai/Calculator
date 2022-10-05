//
//  BaseNavigationController.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavBar()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    func setupNavBar() {
        navigationBar.backgroundColor = UIColor.white
        navigationBar.isTranslucent = false
        isNavigationBarHidden = true
    }
}
