//
//  CustomPrint.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/16.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

public func debugPrint<T>(_ item: T,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line) {
     #if DEBUG
        print("\(Timer.currentTime()) \((file as NSString).lastPathComponent)[\(line)], \(method): \(item)")
    #endif
}


extension Timer{
    
    public static func currentTime() -> String{
        
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyy-MM-dd HH:mm:ss.SSS"
        let strNowTime = timeFormatter.string(from: date)
        return strNowTime
    }
    
    
}
