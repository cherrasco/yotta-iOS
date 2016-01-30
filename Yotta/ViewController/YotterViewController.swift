//
//  YotterViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class YotterViewController: UIViewController {

    @IBOutlet var yotterView: YotterView!
    
    struct Tag {
        enum Button:Int {
            case Yotta = 1
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
        case Tag.Button.Yotta.rawValue:
            
            yotterView.animateYottaTouch()
            Yotter.sharedInstance.postYotta()
            
        default :
            break
        }
    }
    
}
