//
//  UIAlert+Extensions.swift
//  GeneralExtension
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit

public typealias NormalHandler = ()->()

public protocol UIAlertControllerDelegate{

}


extension UIAlertControllerDelegate where Self:UIViewController{
    
    /// alert one button
    public func alertViewNormal(_ message:String,
                                _ title:String="提示",
                                _ actionTitle:String = "确认",
                                _ style:UIAlertControllerStyle = .alert,
                                handler:NormalHandler? = nil){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let cannel = UIAlertController.singleAction(actionTitle, handler: handler)
        
        alert.addAction(cannel)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    /// alert double button
    public func alertViewNormal(_ message:String,
                                _ title:String="提示",
                                _ cannelTitle:String="取消",
                                _ subTitle:String="确认",
                                _ style:UIAlertControllerStyle = .alert,
                                cannelHandler:NormalHandler?,
                                subHandler:NormalHandler?,
                                sender:UIView?=nil){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let cannel = UIAlertAction(title: cannelTitle, style: .destructive) { (_) in
            if cannelHandler != nil {cannelHandler!()}
        }
        let sub = UIAlertAction(title: subTitle, style: .default) { (_) in
            if subHandler != nil {subHandler!()}
        }
        
        let popover = alert.popoverPresentationController
        
        if popover != nil {
            popover?.sourceView = sender
            popover?.sourceRect = (sender?.bounds)!
            popover?.permittedArrowDirections = .any
        }
        
        alert.addAction(cannel)
        alert.addAction(sub)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /// alert textField
    public func alertViewNormal(_ message:String,
                                _ title:String="提示",
                                _ placeholder:String="",
                                _ cannelTitle:String="取消",
                                _ subTitle:String="确认",
                                cannelHandler:NormalHandler?,
                                subHandler:@escaping (String)->()){

    
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {$0.placeholder=placeholder})
        
        let cannel = UIAlertAction(title: cannelTitle, style: .cancel) { (_) in
            if cannelHandler != nil {cannelHandler!()}
        }
        
        let sub = UIAlertAction(title: subTitle, style: .default) { (_) in
            subHandler((alert.textFields?.first?.text)!)}
    
            alert.addAction(cannel)
            alert.addAction(sub)
    
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    /// Alert-Sheet Multiple button
    public func alertViewMultiple(_ message:String,
                                  _ title:String="提示",
                                  _ cannelTitle:String="取消",
                                  subTag:Int = 999980,
                                  subTitle:[(String,Int)],
                                  cannelHandler:NormalHandler?,
                                  subHandler:@escaping (Int)->(),
                                  sender:UIView?=nil){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for (key,tag) in subTitle {
            
            let action = UIAlertAction(title: key, style: .default, handler: { (act) in
                subHandler(tag)
            })
            alert.addAction(action)
        }
        
        let cannel = UIAlertAction(title: cannelTitle, style: .destructive) { (_) in
            if cannelHandler != nil {cannelHandler!()}
        }
        
        alert.addAction(cannel)
        
        
        if let popover = alert.popoverPresentationController {
            popover.sourceView = sender
            popover.sourceRect = (sender?.bounds)!
            popover.permittedArrowDirections = .any
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    

}
    


extension UIAlertController{
    
    public static func singleAlertView(_ title:String,_ message:String) -> UIAlertController{
        
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    public static func singleSheetView(_ title:String,_ message:String) -> UIAlertController{
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
    
    public static func  singleAction(_ title:String,handler:(()->())?) -> UIAlertAction{
    
        return UIAlertAction(title: title, style: .cancel) { (_) in
            if (handler != nil){
                handler!()
            }
        }
    
    }
    
    
}
