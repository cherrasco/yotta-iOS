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
    func completionLayout(completionHandler: (()->Void)? = nil) {
        
        // animate wave
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = maskLayer!.position.x
        animation.toValue = maskLayer!.position.x-190.0
        animation.duration = 0.5
        maskLayer?.addAnimation(animation, forKey: "position.x")
        
        // filled scale
        filledViewHeight.constant = self.bounds.height*1.0
        UIView.animateWithDuration(0.5) {
            self.layoutIfNeeded()
            
            if let completionHandler = completionHandler {
                completionHandler()
            }
        }
    }
    func resetLayout() {
        
        // animate wave
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = maskLayer!.position.x
        animation.toValue = maskLayer!.position.x-190.0
        animation.duration = 0.5
        maskLayer?.addAnimation(animation, forKey: "position.x")
        
        // filled scale
        filledViewHeight.constant = self.bounds.height*0.0
        UIView.animateWithDuration(0.5) {
            self.layoutIfNeeded()
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
    func animateDropText() {
        let textLayer = CATextLayer()
        textLayer.string = "Yotta"
        textLayer.font = UIFont.boldSystemFontOfSize(30)
        textLayer.foregroundColor = self.filledView.backgroundColor?.CGColor
        textLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        textLayer.position.x = self.bounds.width*CGFloat(Double(arc4random()) / Double(UINT32_MAX))
        self.layer.insertSublayer(textLayer, below: filledView.layer)
        
        let dropAnimation = CABasicAnimation(keyPath: "position.y")
        dropAnimation.fromValue = 0.0
        dropAnimation.toValue = self.bounds.height
        dropAnimation.duration = 2.0
        dropAnimation.removedOnCompletion = false
        dropAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        dropAnimation.fillMode = kCAFillModeForwards
        textLayer.addAnimation(dropAnimation, forKey: "position.y")
        
    }
    
}
