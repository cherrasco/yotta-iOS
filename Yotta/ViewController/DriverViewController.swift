//
//  DriverViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation
import AudioToolbox

class DriverViewController: UIViewController {

    @IBOutlet var driveView: DriveView!
    
    private var audioPlayer = YottaSoundPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        driveView.setMaskLayer()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "yottaUpdated:", name: Constants.NotificationKey.Drive.Yotta.Updated, object: nil)
        
        Driver.sharedInstance.startReloadingYotta()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Notification actions
    func yottaUpdated(sender: NSNotification) {
        if let yotta : Driver.Yotta = sender.userInfo?["yotta"] as? Driver.Yotta {
            driveView.setFilledScale(yotta.whole)
            driveView.setColorScale(yotta.recent)
            driveView.animateWaveLayer()
        }
        driveView.animateDropText()

    internal func playYottaSound() {
        audioPlayer.playYottaSound()
    }
}
