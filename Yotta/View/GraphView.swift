//
//  GraphView.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var graphRects: [CALayer] = []
    
    func generateGraphRects(number: Int) {
        for layer in graphRects {
            layer.removeFromSuperlayer()
        }
        graphRects = []
        
        for i in 0...number-1 {
            let newLayer = CALayer()
            newLayer.frame = CGRect(x: self.bounds.width*CGFloat(i/number), y: 0, width: self.bounds.width/CGFloat(number), height: self.bounds.height)
            self.layer.addSublayer(newLayer)
            graphRects.append(newLayer)
        }
        
    }
    
    func renderGraph() {
        
        for (index, graphRect) in graphRects.enumerate() {
            let lineShape = CAShapeLayer()
            let linePath = UIBezierPath()
            
            let strokeXStart : CGFloat = self.bounds.width*CGFloat(index)/CGFloat(graphRects.count)
            let strokeXEnd : CGFloat = self.bounds.width*CGFloat((index+1))/CGFloat(graphRects.count)
            
            var strokeYStart : CGFloat = self.bounds.height
            let strokeYEnd : CGFloat = self.bounds.height*CGFloat(Driver.sharedInstance.yottaRecords[index].recent)
            
            if index != 0 {
                strokeYStart = self.bounds.height*CGFloat(Driver.sharedInstance.yottaRecords[index-1].recent)
            }
            
            linePath.moveToPoint(CGPoint(x: strokeXStart, y: strokeYStart))
            linePath.addLineToPoint(CGPoint(x: strokeXEnd, y: strokeYEnd))
            lineShape.path = linePath.CGPath
            lineShape.strokeColor = UIColor.redColor().CGColor
            graphRect.addSublayer(lineShape)
        }
        
    }

}
