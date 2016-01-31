//
//  MapViewController.swift
//  Yotta
//
//  Created by mulyu on 2016/01/31.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit
import Alamofire

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
                let yottaResult = YottaResult.create(runInformationArray, countYotta: countYotta, yottaRunInformations: yottaRunInformationArray)
                
                
            } else {
                print("Failed.")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
