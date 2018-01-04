//
//  UIViewTagHistory.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

public class UIViewTagHistory {
    private var his:[String:Int] = [:]
    static let manager = UIViewTagHistory()
    private init() {}
    
    static func intance() -> UIViewTagHistory {
        return manager
    }
    
    @discardableResult
    public func add(_ key:String,tag:Int) -> UIViewTagHistory{
        self.his[key] = tag
        return self
    }
    
    @discardableResult
    public func remove(_ key:String) -> UIViewTagHistory{
        self.his.removeValue(forKey: key)
        return self
    }
    
    @discardableResult
    public func revise(_ key:String,tag:Int) -> UIViewTagHistory{
        return self.add(key, tag: tag)
    }
    
    @discardableResult
    public func removeAll() -> UIViewTagHistory{
        self.his.removeAll()
        return self
    }
    
    public func query(_ key:String) ->Int?{
        if let value = self.his["key"] {
            return value
        }
        return nil
    }
}
