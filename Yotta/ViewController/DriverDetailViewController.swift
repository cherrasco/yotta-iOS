//
//  DriverDetailViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class DriverDetailViewController: UIViewController {

    struct Tag {
        enum Button:Int {
            case Close = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTouchUpInside(sender: UIButton) {
        switch sender.tag {
        case Tag.Button.Close.rawValue:
            self.dismissViewControllerAnimated(true) {
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.Reset, object: nil)
            }
        default :
            break
        }
    }
    
}
