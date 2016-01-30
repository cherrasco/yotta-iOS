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
    
    @IBOutlet weak var yottaMargin: NSLayoutConstraint!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    func animateYottaTouch() {
        
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
    }
}
