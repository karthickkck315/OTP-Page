//
//  UIColor+CustomColor.swift
//  Hoovene
//
//  Created by Karthick on 13/06/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

import UIKit

extension UIColor {
    
    /* class func customGrayColor() -> UIColor {
     let r: CGFloat = CGFloat(41.0/255.0)
     let g: CGFloat = CGFloat(41.0/255.0)
     let b: CGFloat = CGFloat(41.0/255.0)
     return UIColor(red: r, green: g, blue: b, alpha: 1.0)
     }*/
    
    class func customWhite() -> UIColor {
        return UIColor.white
    }
    
    class func customColor() -> UIColor {
        return UIColor(red: 29.0/255.0, green: 29.0/255.0, blue: 37.0/255.0, alpha: 1.0)
    }
    
    class func customBlackColor() -> UIColor {
        //        return UIColor(red: 29.0/255.0, green: 29.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        return UIColor.black
    }
    class func customGreenColor() -> UIColor {
        //        return UIColor(red: 29.0/255.0, green: 29.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        return UIColor(red: 56.0/255.0, green: 202.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    //Custom color
    // MARK: - StatusBar color
    class func statusBarBlackColor() -> UIColor {
        return UIColor(red: 29.0/255.0, green: 30.0/255.0, blue: 32.0/255.0, alpha: 1.0)
    }
    // MARK: - CustomBlack Color
    class func headerBlackColor() -> UIColor {
        return UIColor(red: 34.0/255.0, green: 35.0/255.0, blue: 37.0/255.0, alpha: 1.0)
    }
    // MARK: - Custom White Color
    class func customWhiteColor() -> UIColor {
        return UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }
    //MARK: - Custom Gray Color
    class func customGrayColor() -> UIColor {
        return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
    }
    // MARK: - Custom DarkGary Color
    class func customDrakGrayColor() -> UIColor {
        return UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    }
    // MARK: - Custom Border Color
    class func customBorderColor() -> UIColor {
        return UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    }
    
    // MARK: - Custom Button Gray Color
    class func buttonBackGroundGrayColor() -> UIColor {
        return UIColor(red: 67.0/255.0, green: 67.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        
        //return UIColor(red: 77.0/255.0, green: 201.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    }
    
    // MARK: - Custom Button Green Color
    class func buttonBackGroundGreenColor() -> UIColor {
        return UIColor(red: 77.0/255.0, green: 201.0/255.0, blue: 63.0/255.0, alpha: 1.0)
    }
    
    // MARK: - Custom Button Red Color
    class func buttonBackGroundRedColor() -> UIColor {
        return UIColor(red: 209.0/255.0, green: 25.0/255.0, blue: 111.0/255.0, alpha: 1.0)
    }
    
    // MARK: - Custom Button Red Color
    class func appThemeColor() -> UIColor {
        return UIColor(red: 209.0/255.0, green: 25.0/255.0, blue: 111.0/255.0, alpha: 1.0)
    }
    
    // MARK: - Custom LightGray Color
    class func customLightGrayColor() -> UIColor {
        return UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    }
    
    // MARK: - cellBackGroundColor Color
    class func cellBackGroundColor() -> UIColor {
        return UIColor(red: 250.0/255.0, green: 252.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    }
    // MARK: - TabButton Color
    class func tabButtonBackGroundColor() -> UIColor {
        return UIColor(red: 57.0/255.0, green: 57.0/255.0, blue: 57.0/255.0, alpha: 1.0)
    }
    
    // MARK: - App Blue Color
    class func appBlueColor() -> UIColor {
        return UIColor(red: 93.0/255.0, green: 191.0/255.0, blue: 249.0/255.0, alpha: 1.0)
    }
    
    class func appAlphaBackGroundColor() -> UIColor {
        return UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    }
    
    convenience init(hexaString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexaString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}
