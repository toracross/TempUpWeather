//
//  GradientBackground.swift
//  rainyshinyapp
//
//  Created by Wellison Pereira on 12/6/16.
//  Copyright © 2016 Tora Cross. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func blueGradient() -> CAGradientLayer {
        let topColor = UIColor(red: (227/255.0), green: (242/255.0), blue: (253/255.0), alpha: 1) //Lighter Color
        let bottomColor = UIColor(red: (13/255.0), green: (71/255.0), blue: (161/255.0), alpha: 1) //Darker Color
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        return gradientLayer
    }
}
