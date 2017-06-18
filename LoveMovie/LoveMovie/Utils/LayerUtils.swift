//
//  LayerUtils.swift
//  TipCalculator
//
//  Created by Duy Nguyen on 6/4/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

enum GradientDirection {
    case horizontal, vertical
}

extension UIView {
    
    func applyGradient(colours: [UIColor], direction flow: GradientDirection = .vertical) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        
        gradient.colors = colours.map { $0.cgColor }
        
        if flow == .horizontal {
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        self.layer.addSublayer(gradient)
    }
}
