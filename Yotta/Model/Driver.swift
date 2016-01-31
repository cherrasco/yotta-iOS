//
//  Driver.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit
import Alamofire

class Driver: NSObject {
    
    class Yotta {
        var recent : Double = 0.0
        var whole : Double = 0.0
        var createdDate : NSDate = NSDate()
    }
    
    // MARK:- Properties
    static let sharedInstance = Driver()
    
    var reloadTimer : NSTimer? = nil
    
    var yotta = Yotta() {
        didSet {
            yottaRecords.append(yotta)
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.Updated, object: nil,userInfo: ["yotta":yotta])
        }
    }
    var yottaRecords : [Yotta] = []
    
    // MARK:- Methods : load remote data
    func loadYotta() {
        Alamofire.request(.GET, Constants.API.Drives.GET+String(1)+Constants.API.Drives.RunInformations.Analysis).responseJSON { response -> Void in
            if let json = response.result.value as? [String:AnyObject] {
                let newValue = Yotta()
                newValue.recent = json["recent_yotta"] as! Double
                newValue.whole = json["whole_yotta"] as! Double
                
                self.yotta = newValue
            }
        }
    }
    func startReloadingYotta() {
        
        yottaRecords = []
        
        if let reloadTimer = reloadTimer {
            reloadTimer.fire()
        }
        else {
            reloadTimer = NSTimer(timeInterval: Constants.Time.Yotter.Reload.Interval, target: NSBlockOperation(block: {
                self.loadYotta()
            }), selector: "main", userInfo: nil, repeats: true)
            reloadTimer?.fire()
            NSRunLoop.currentRunLoop().addTimer(reloadTimer!, forMode: NSRunLoopCommonModes)
            
        }
    }
    func stopReloadingYotta() {
        if let reloadTimer = reloadTimer {
            reloadTimer.invalidate()
        }
    }

}
