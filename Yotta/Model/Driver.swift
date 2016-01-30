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
    }
    
    // MARK:- Properties
    static let sharedInstance = Driver()
    
    var reloadTimer : NSTimer? = nil
    
    var yotta = Yotta() {
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.Updated, object: nil,userInfo: ["yotta":yotta])
        }
    }
    
    // MARK:- Methods : load remote data
    func loadYotta() {
        let newValue = Yotta()
        newValue.recent = Double(arc4random()) / Double(UINT32_MAX)
        newValue.whole = Double(arc4random()) / Double(UINT32_MAX)
        
        self.yotta = newValue
    }
    func startReloadingYotta() {
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
