//
//  UIView + Ext.swift
//  kompanion
//
//  Created by Bakai Ismaiilov on 05.09.2022.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    var safeArea: ConstraintBasicAttributesDSL {
#if swift(>=3.2)
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }
        return self.snp
#else
        return self.snp
#endif
    }
    
    func width(divider: Double) -> Double {
        return frame.width / divider
    }
    
    func height(divider: Double) -> Double {
        return frame.height / divider
    }
}

extension UIView {
    func topLeft() {
        
    }
}

extension UIView {
   
}

extension UIView {
    func drawDashedLine(start p0: CGPoint, end p1: CGPoint, color: UIColor,view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineDashPattern = [3,3]
        
        let path = CGMutablePath()
        
        path.addLines(between: [p0,p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
}
