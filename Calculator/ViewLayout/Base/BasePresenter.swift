//
//  BasePresenter.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation

class BasePresenter<Router> {
        
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
}
