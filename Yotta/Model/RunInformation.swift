//
//  RunInformation.swift
//  Yotta
//
//  Created by Yu Kadowaki on 1/31/16.
//  Copyright © 2016 cherrasco. All rights reserved.
//

import Foundation
import MapKit

class RunInformation {
    private var lat: CLLocationDegrees!
    private var lon: CLLocationDegrees!
    
    static func create(lat: CLLocationDegrees, lon: CLLocationDegrees) -> RunInformation {
        let runInformation = RunInformation()

        runInformation.lat = lat
        runInformation.lon = lon
        
        return runInformation
    }
    
    internal func setLat(lat: CLLocationDegrees) {
        self.lat = lat
    }
    
    internal func setLon(lon: CLLocationDegrees) {
        self.lon = lon
    }

    internal func getLat() -> CLLocationDegrees {
        return self.lat
    }
    
    internal func getLon() -> CLLocationDegrees {
        return self.lon
    }
}