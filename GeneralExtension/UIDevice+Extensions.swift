//
//  UIDevice+Extensions.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

public enum DeviceType{
    case iPhone4,iPhone5,iPhone6,iPhone6P,iPhoneX,ipad
}

extension UIDevice{
    
    public static let devName:String = UIDevice.current.name
    
    public static let sysName:String = UIDevice.current.systemName
    
    public static let sysVersion:String = UIDevice.current.systemVersion
    
    public static let devUUID:String = (UIDevice.current.identifierForVendor?.uuidString)!
    
    public static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    
    public static let isPad = UIDevice.current.userInterfaceIdiom == .pad
    
    public static var deviceType:DeviceType{
        let height = UIScreen.main.bounds.height
        
        switch height {
            case 480:
                return .iPhone4
            case 667:
                return .iPhone6
            case 736:
                return .iPhone6P
            case 568:
                return .iPhone5
            case 812:
                return .iPhoneX
            default:
                return .ipad
        }
        
    }
    
}

extension Bundle{
    
    static let info = Bundle.main.infoDictionary
    
    static let appName:String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    
    static let appVersion:String = Bundle.info!["CFBundleShortVersionString"] as! String
    
    static let appBuildVersion = Bundle.info!["CFBundleVersion"] as! String
    
    
}
