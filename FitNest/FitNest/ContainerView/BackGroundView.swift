//
//  BackGroundView.swift
//  FitNest
//
//  Created by Vahid Ismayilov on 25.10.25.
//

import UIKit

class BackgroundView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        gradientLayer.type = .radial
         
        gradientLayer.colors = [
            UIColor(red: 0.12, green: 0.16, blue: 0.25, alpha: 1.0).cgColor,
            UIColor(red: 0.07, green: 0.10, blue: 0.15, alpha: 1.0).cgColor,
            UIColor(red: 0.03, green: 0.05, blue: 0.10, alpha: 1.0).cgColor,
            UIColor(red: 0.01, green: 0.01, blue: 0.06, alpha: 1.0).cgColor
        ]
         
        gradientLayer.locations = [0.0, 0.2, 0.5, 0.8]
        gradientLayer.startPoint = CGPoint(x: 0.9, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.2, y: 0.55)
         
        layer.insertSublayer(gradientLayer, at: 0)
     }
}

