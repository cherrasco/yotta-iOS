//
//  CustomHelper.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class Translate {
    class Color {
        static func scaledColor(scale:Double,isBackground:Bool=false)-> UIColor {
            let convertedScale = CGFloat(scale)
            var lowerRed : CGFloat = 0.0
            var lowerGreen : CGFloat = 0.0
            var lowerBlue : CGFloat = 0.0
            var lowerAlpha : CGFloat = 0.0
            var upperRed : CGFloat = 0.0
            var upperGreen : CGFloat = 0.0
            var upperBlue : CGFloat = 0.0
            var upperAlpha : CGFloat = 0.0
            
            Constants.Color.LowerBound.getRed(&lowerRed, green: &lowerGreen, blue: &lowerBlue, alpha: &lowerAlpha)
            Constants.Color.UpperBound.getRed(&upperRed, green: &upperGreen, blue: &upperBlue, alpha: &upperAlpha)
            if isBackground {
                return UIColor(red: lowerRed+(upperRed-lowerRed)*convertedScale, green: lowerGreen+(upperGreen-lowerGreen)*convertedScale, blue: lowerBlue+(upperBlue-lowerBlue)*convertedScale, alpha: 0.5)
            }
            else {
                return UIColor(red: lowerRed+(upperRed-lowerRed)*convertedScale, green: lowerGreen+(upperGreen-lowerGreen)*convertedScale, blue: lowerBlue+(upperBlue-lowerBlue)*convertedScale, alpha: lowerAlpha+(upperAlpha-lowerAlpha)*convertedScale)
            }
        }
    }
}
