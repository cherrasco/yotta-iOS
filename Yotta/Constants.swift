//
//  Constants.swift
//  Yotta
//
//  Created by mulyu on 2016/01/30.
//  Copyright © 2016年 cherrasco. All rights reserved.
//

import UIKit

class Constants {
    struct Time {
        struct Yotter {
            struct Reload {
                static let Interval = 5.0
            }
        }
        struct DriverView {
            struct Animation {
                static let Duration = 5.0
            }
        }
    }
    struct Color {
        static let LowerBound : UIColor = UIColor(red: 0.18, green: 0.8, blue: 0.443, alpha: 1.0)
        static let UpperBound : UIColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1.0)
    }
    struct API {
        
    }
    struct NotificationKey {
        struct Drive {
            struct Yotta {
                static let Updated = "kNotificationKeyDriveYottaUpdated"
            }
        }
    }
}
