//
//  YotterView.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class YotterView: UIView {

    @IBOutlet weak var yottaLabel: UILabel!
    @IBOutlet weak var yottaButton: UIButton!
    
    @IBOutlet weak var yottaCenterX: NSLayoutConstraint!
    @IBOutlet weak var yottaMargin: NSLayoutConstraint!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    func animateYottaTouch() {
        
        // pop label animation
        self.yottaMargin.constant = 20
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.yottaLabel.alpha = 1.0
            self.layoutIfNeeded()
            }) { result -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.yottaLabel.alpha = 0.0
                    }) { result -> Void in
                        self.yottaMargin.constant = 5
                }
        }
        
        // 
        let vibrateAnimation = CABasicAnimation(keyPath: "position.x")
        vibrateAnimation.duration = 0.05
        vibrateAnimation.repeatCount = 4
        vibrateAnimation.autoreverses = true
        vibrateAnimation.fromValue = yottaButton.center.x-3
        vibrateAnimation.toValue = yottaButton.center.x+3
        yottaButton.layer.addAnimation(vibrateAnimation, forKey: "position.x")
        
    }
}
