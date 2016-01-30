//
//  Yotter.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit
import Alamofire

class Yotter: NSObject {

    static let sharedInstance = Yotter()
    
    var lastYotta : NSTimeInterval? = nil
    
    func postYotta() {
        
        Alamofire.request(.POST, "http://www.google.com").responseJSON { response -> Void in
            
        }
    }
    
}
