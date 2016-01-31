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
        Alamofire.request(.GET, Constants.API.Yotter.GET).responseJSON { response -> Void in
            if let json = response.result.value as? Dictionary<String,AnyObject> {
                let driveId = json["drive_id"] as! Int
                //Alamofire.request(.POST, Constants.API.Yotter.POST, parameters: ["drive_id":driveId])
            }
        }
    }
    
}
