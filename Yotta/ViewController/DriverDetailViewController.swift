//
//  DriverDetailViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit
import Alamofire

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

    private var yottaResult = YottaResult()
    
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
        
        
        Alamofire.request(.GET, "http://52.193.68.0/drives/3/run_informations", parameters: nil).responseJSON(completionHandler: { response in
            if let result = response.result.value as? NSDictionary, runInformations = result["run_informations"] as? Array<Dictionary<String, AnyObject>>, countYotta = result["count_yotta"] as? Int, yottaRunInformations = result["yotta_run_informations"] as? Array<Dictionary<String, AnyObject>> {
                
                var runInformationArray = Array<RunInformation>()
                var yottaRunInformationArray = Array<RunInformation>()
                
                for runInformation in runInformations {
                    if let lat = runInformation["latitude"] as? String, lon = runInformation["longitude"] as? String {
                        runInformationArray.append(RunInformation.create(atof(lat), lon: atof(lon)))
                    }
                }
                
                for yottaRunInformation in yottaRunInformations {
                    if let lat = yottaRunInformation["latitude"] as? String, lon = yottaRunInformation["longitude"] as? String {
                        yottaRunInformationArray.append(RunInformation.create(atof(lat), lon: atof(lon)))
                    }
                }
                
                // NOTE: この yottaResult に全部のデータを格納
                self.yottaResult = YottaResult.create(runInformationArray, countYotta: countYotta, yottaRunInformations: yottaRunInformationArray)
                
                
            } else {
                print("Failed.")
            }
        })
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
