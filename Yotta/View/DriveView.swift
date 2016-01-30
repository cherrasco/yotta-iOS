//
//  DriveView.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class DriveView: UIView {

    // MARK:- Property
    var maskLayer : CALayer? = nil
    
    // MARK:- Property IBOutlet
    @IBOutlet weak var filledView: UIView!
    @IBOutlet weak var waveView: UIView!
    @IBOutlet weak var filledViewHeight: NSLayoutConstraint!
    
    // MARK:- Methods Setter Layout
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
            self.waveView.backgroundColor = Translate.Color.scaledColor(scale)
        }
    }
    func setMaskLayer() {
        if let maskLayer = maskLayer {
            maskLayer.contents = UIImage(named: "WaveMaskImage")?.CGImage
            maskLayer.frame = waveView.bounds
        }
        else {
            let newMaskLayer = CALayer()
            newMaskLayer.contents = UIImage(named: "WaveMaskImage")?.CGImage
            newMaskLayer.frame = waveView.bounds
            
            maskLayer = newMaskLayer
            waveView.layer.mask = maskLayer
        }
    }
    
    // MARK:- Methods Animate Layer
    func animateWaveLayer() {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = maskLayer!.position.x
        animation.toValue = maskLayer!.position.x-190.0
        animation.duration = Constants.Time.DriverView.Animation.Duration
        maskLayer?.addAnimation(animation, forKey: "position.x")
    }
    
}
