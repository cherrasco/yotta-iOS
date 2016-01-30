//
//  DriveView.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class DriveView: UIView {

    @IBOutlet weak var filledView: UIView!
    
    @IBOutlet weak var filledViewHeight: NSLayoutConstraint!
    
    func setFilledScale(scale: Double) {
        filledViewHeight.constant = self.bounds.height*CGFloat(scale)
        UIView.animateWithDuration(Constants.Time.DriverView.Animation.Duration) {
            self.layoutIfNeeded()
        }
    }
    func setColorScale(scale: Double) {
        UIView.animateWithDuration(Constants.Time.DriverView.Animation.Duration) {
            self.backgroundColor = Translate.Color.scaledColor(scale,isBackground: true)
            self.filledView.backgroundColor = Translate.Color.scaledColor(scale)
        }
    }
}
