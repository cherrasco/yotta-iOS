//
//  DriverDetailView.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class DriverDetailView: UIView {

    @IBOutlet weak var yottaCountLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    
    func setThemaColor(color: UIColor) {
        self.backgroundColor = color
        self.closeButton.setTitleColor(color, forState: .Normal)
        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
