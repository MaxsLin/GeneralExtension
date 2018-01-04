//
//  UIColor+Extensions.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

extension UIColor{
    
    public convenience init(_ hexColor: String) {
        
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    
}
extension String{
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return String(self[startIndex..<endIndex])
        }
    }
    
}
