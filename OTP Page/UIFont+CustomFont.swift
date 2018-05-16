//
//  UIFont+CustomFont.swift
//  Hoovene
//
//  Created by Karthick on 12/06/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

import UIKit

//class UIFont_CustomFont: UIFont {
//    
//    class func regular(ofSize size: CGFloat) -> UIFont {
//            return UIFont(name: "Font-Regular", size: size)!
//        }
//    
//    func lightSystemFont(ofSize size: CGFloat) -> UIFont {
//        return UIFont(name: "CustomFont-Light", size: size)!
//    }
//    func systemFontOfSize(size: CGFloat) -> UIFont {
//        return UIFont(name: "CustomFont-Bold", size: size)!
//    }
//    
//    func boldSystemFont (ofSize size: CGFloat) -> UIFont {
//        return UIFont(name: "CustomFont-Bold", size: size)!
//    }
//    
//}
//MARK: - Set Font Name

enum FontName: String{
  case regular = "ProximaNova-Regular"
}

//MARK: - Set Font Size
enum FontSize: CGFloat {
  case font10 = 10
  case font12 = 12
  case font14 = 14
  case font16 = 16
  case font18 = 18
  case font20 = 20
  case font22 = 22
  case font30 = 30
}

extension UIFont {
  
  
  
  // MARK: - Regular fonts
  class func regularFont10() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font10.rawValue)!
  }
  
  class func regularFont12() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font14.rawValue)!
  }
  
  class func regularFont14() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font14.rawValue)!
  }
  
  class func regularFont16() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font16.rawValue)!
  }
  
  class func regularFont18() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font18.rawValue)!
  }
  
  class func regularFont20() -> UIFont {
    return UIFont(name: FontName.regular.rawValue, size: FontSize.font20.rawValue)!
  }
 
}
