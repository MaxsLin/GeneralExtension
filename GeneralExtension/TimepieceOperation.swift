//
//  Metch+Extension.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

public struct TimepieceOperation {
    
    var timeCount:Int
    var interval:Int
    var cannelBlock:(()->())?
    let codeTimer = DispatchSource.makeTimerSource(queue:      DispatchQueue.global())
    public init(_ timeCount:Int,interval:Int = 1){
        
        self.timeCount = timeCount
        self.interval = interval
    }
    
    @discardableResult
    public  func  piece(_ closure:@escaping(Int)->()) ->TimepieceOperation{
        
        func dispatch_Timer(block:@escaping ()->()){
            
            codeTimer.schedule(deadline: .now(), repeating: .seconds(self.interval))
            codeTimer.setEventHandler(handler: block)
            codeTimer.resume()
        }
        
        var count = self.timeCount
        
        dispatch_Timer {
            
            count = count - self.interval
            
            guard count >= 0 else {
                
                self.cannel()
                return
            }
            
            DispatchQueue.main.async(execute: {
                closure(count)
            })
            
        }
        return self
    }
    @discardableResult
    public mutating func cannelClosure(_ closure:@escaping ()->()) -> TimepieceOperation{
        
        self.cannelBlock = closure
        return self
    }
    
    public func cannel(){
        
        codeTimer.cancel()
        DispatchQueue.main.async {
            self.cannelBlock?()
        }
        
    }
}
