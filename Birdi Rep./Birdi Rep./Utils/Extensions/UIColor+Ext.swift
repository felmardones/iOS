//
//  UIColor+Ext.swift
//  Birdi Rep.
//
//  Created by Felipe on 28-02-20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import UIKit


extension UIColor{
    
    static func createGradientLayer(bounds: CGRect, colors: [CGColor],locations: [NSNumber]) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.colors =  colors
        gradient.locations = locations
        gradient.frame  = bounds
        gradient.startPoint   = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint     = CGPoint(x: 0.85, y: 0.5)
        
        return gradient
    }
    
    func lighter(by percentage: CGFloat = 40.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 40.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 40.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}



