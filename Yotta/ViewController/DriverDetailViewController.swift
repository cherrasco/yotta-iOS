//
//  DriverDetailViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class DriverDetailViewController: UIViewController {

    struct Tag {
        enum Button:Int {
            case Close = 1
        }
    }
    
    @IBOutlet var driverDetailView: DriverDetailView!
    
    var mapViewController : MapViewController?
    var graphViewController : GraphViewController?
    
    var themaColor : UIColor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let themaColor = themaColor {
            driverDetailView.setThemaColor(themaColor)
        }
        
        mapViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as? MapViewController
        graphViewController = self.storyboard!.instantiateViewControllerWithIdentifier("GraphViewController") as? GraphViewController
        
        mapViewController!.view.frame = self.driverDetailView.centerContainerView.bounds
        graphViewController!.view.frame = self.driverDetailView.centerContainerView.bounds
        
        // set default map
        self.addChildViewController(mapViewController!)
        self.driverDetailView.centerContainerView.addSubview(mapViewController!.view)
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapViewController!.view.frame = self.driverDetailView.centerContainerView.bounds
        graphViewController!.view.frame = self.driverDetailView.centerContainerView.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTouchUpInside(sender: UIButton) {
        switch sender.tag {
        case Tag.Button.Close.rawValue:
            self.dismissViewControllerAnimated(true) {
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.Reset, object: nil)
            }
        default :
            break
        }
    }
    
    @IBAction func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            graphViewController?.view.removeFromSuperview()
            graphViewController?.removeFromParentViewController()
            self.addChildViewController(mapViewController!)
            self.driverDetailView.centerContainerView.addSubview(mapViewController!.view)
        case 1:
            mapViewController?.view.removeFromSuperview()
            mapViewController?.removeFromParentViewController()
            self.addChildViewController(graphViewController!)
            self.driverDetailView.centerContainerView.addSubview(graphViewController!.view)
        default:
            break
        
        }
    }
}
