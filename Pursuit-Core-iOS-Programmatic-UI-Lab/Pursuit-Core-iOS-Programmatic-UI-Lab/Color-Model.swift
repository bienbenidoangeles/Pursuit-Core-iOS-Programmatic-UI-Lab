//
//  Color-Model.swift
//  Pursuit-Core-iOS-Programmatic-UI-Lab
//
//  Created by Bienbenido Angeles on 1/28/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class ColorModel {
    static func genRandomColor () -> UIColor {
        let redRandom = CGFloat.random(in: 0.0...1.0)
        let greenRandom = CGFloat.random(in: 0.0...1.0)
        let blueRandom = CGFloat.random(in: 0.0...1.0)
        let alphaRandom = CGFloat.random(in: 0.5...1.0)
        
        let randomColor = UIColor(red: redRandom, green: greenRandom, blue: blueRandom, alpha: alphaRandom)
        return randomColor
    }
    
    static func getMaxColor (bgColor: UIColor) -> Int {
        
        var red = CGFloat() // 0
        var green = CGFloat() // 1
        var blue = CGFloat() // 2
        var alpha = CGFloat()
        var color = [CGFloat]()
        
        //how to refractor this code and I don't understand why I need to use "&" symbol on each given variable
        bgColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        color.append(red)
        color.append(green)
        color.append(blue)
        
        var maxColorIndex = -1
        
        //get index of max color
        for (index, rgb) in color.enumerated() {
            if rgb == color.max() {
                maxColorIndex = index
            }
        }
        return maxColorIndex
    }
}
