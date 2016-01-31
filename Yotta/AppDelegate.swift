//
//  AppDelegate.swift
//  Yotta
//
//  Created by Yu Kadowaki on 1/30/16.
//  Copyright © 2016 cherrasco. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        settingRemoteNotification()
        window?.backgroundColor = UIColor.whiteColor()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
        if let state : Int = userInfo["state"] as? Int {
            switch state {
            case 0:
                // start 
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.WillStart, object: nil)
            case 1:
                // end
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.WillEnd, object: nil)
            case 2:
                // yotta
                if let tabBarController = window?.rootViewController as? UITabBarController {
                    for viewController in tabBarController.viewControllers! {
                        if let driveViewController = viewController as? DriverViewController {
                            driveViewController.playYottaSound()
                        }
                    }
                }
                
                NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.Drive.Yotta.Yotted, object: nil)
            default:
                break
            }
        }
        
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        completionHandler(UIBackgroundFetchResult.NewData)
    }

    func settingRemoteNotification() {
        let osVersion = UIDevice.currentDevice().systemVersion

        if(NSString(string: osVersion).floatValue >= 8.0) {
            let notificationSettings = UIUserNotificationSettings(forTypes: [.Badge, .Alert, .Sound], categories: nil)
            UIApplication.sharedApplication().registerForRemoteNotifications()
            UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        }
        else {
            UIApplication.sharedApplication().registerForRemoteNotificationTypes([.Badge, .Alert, .Sound])
        }
    }

    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("device token = \(deviceToken)")

        let deviceTokenString = deviceToken.description.stringByReplacingOccurrencesOfString(" ", withString: "_")

        self.setAndSendDeviceToken(deviceTokenString)
    }

    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Fail to regist device token. error: \(error)")
    }

    func setAndSendDeviceToken(tempDeviceToken: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let deviceToken = userDefaults.stringForKey("deviceToken")
        if deviceToken != tempDeviceToken {
            // TODO: 要リクエスト先変更
            Alamofire.request(.POST, "http://52.68.60.142/yotta-server/ios_push_notification_sample.php", parameters: [ "device_token" : tempDeviceToken ]).responseJSON(completionHandler: { response in
                if let result = response.result.value as? NSDictionary, status = result["status"] as? String {
                    print(status)
                    userDefaults.setObject(tempDeviceToken, forKey: "deviceToken")
                } else {
                    print("Failed register device token.")
                }
            })
        }
        else {
            print("device token is already up-to-date")
        }
    }
}