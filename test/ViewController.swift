//
//  ViewController.swift
//  test
//
//  Created by maxmak on 2018/1/4.
//  Copyright © 2018年 MaxMak. All rights reserved.
//

import UIKit
import GeneralExtension
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("\(UIScreen.main.bounds)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.alertViewNormal("sd")
//        self.alertViewNormal("asd", cannelHandler: nil, subHandler: nil)
//        self.alertViewNormal("as", "as", "1", "2", .actionSheet, cannelHandler: nil, subHandler: nil, sender: UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)))
//        self.alertViewNormal("aa", cannelHandler: {
//
//        }) { (tx) in
//
//            self.alertViewNormal(tx)
//        }
        
//        self.alertViewMultiple("asd", subTitle: [("1",1),("2",2),("3",3)], cannelHandler: {
//            self.alertViewNormal("sd")
//        }) { (index) in
//            self.alertViewNormal("\(index)")
//        }
//
        self.alertViewMultiple("12", "34", "can", subTag: 90000, subTitle: [("1",1),("2",2),("3",3)], cannelHandler: {
            self.alertViewNormal("can")
        }, subHandler: { (index) in
            self.alertViewNormal("\(index)")
        }, sender: UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100)))
    }


}


extension ViewController:UIAlertControllerDelegate{
   
    
    
    
}


