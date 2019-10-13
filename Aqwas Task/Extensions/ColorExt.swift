//
//  ColorExt.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/11/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    // create color from hex
    
    @objc convenience init(hexString: String) {
        let scanner = Scanner(string: hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x0000_00FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    @objc convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }

    // convert color to hex
    @objc func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = Int(r * 255) << 16 | Int(g * 255) << 8 | Int(b * 255) << 0
        return NSString(format: "#%06x", rgb) as String
    }
}
