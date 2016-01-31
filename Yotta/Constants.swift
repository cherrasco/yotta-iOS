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
                static let Interval = 10.0
            }
        }
        struct DriverView {
            struct Animation {
                static let Duration = 10.0
            }
        }
    }
    struct Color {
        static let LowerBound : UIColor = UIColor(red: 0.18, green: 0.8, blue: 0.443, alpha: 1.0)
        static let UpperBound : UIColor = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1.0)
    }
    struct API {
        struct Drives {
            static let GET = "http://52.193.68.0/drives/"
            struct RunInformations {
                static let Analysis = "/run_informations/analysis"
            }
        }
        struct Yotter {
            static let POST = "http://52.193.68.0/yotta"
            static let GET = "http://52.193.68.0/users/1/latest_drive_id.json"
        }
    }
    struct NotificationKey {
        struct Drive {
            struct Yotta {
                static let WillStart = "kNotificationKeyDriveYottaWillStart"
                static let WillEnd = "kNotificationKeyDriveYottaWillEnd"
                static let Updated = "kNotificationKeyDriveYottaUpdated"
                static let Reset = "kNotificationKeyDriveYottaReset"
            }
        }
    }
    struct SegueIdentifier {
        struct Driver {
            static let ShowDetail = "kSegueIdentifierDriverShowDetail"
        }
    }
}
