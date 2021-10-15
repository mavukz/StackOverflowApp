//
//  UIColor+Extensions.swift
//  StackOverflowApp
//
//  Created by Luntu Mavukuza on 2021/10/06.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 || hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = hexColor.count == 8 ? CGFloat(hexNumber & 0x000000ff) / 255 : 1
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
            debugPrint("Invalid hex color code")
        }
        return nil
    }
}

// MARK: - Color Palette
extension UIColor {
    
    static let primaryBlueColor = UIColor(hex: "#4078C4")
    static let primaryGrayColor = UIColor(hex: "#8F8E94")
}
