//
//  YottaResult.swift
//  Yotta
//
//  Created by Yu Kadowaki on 1/31/16.
//  Copyright © 2016 cherrasco. All rights reserved.
//

import Alamofire

class YottaResult {
    private var runInformations: Array<RunInformation>!
    private var countYotta: Int!
    private var yottaRunInformations: Array<RunInformation>!
    
    static func create(runInformations: Array<RunInformation>, countYotta: Int, yottaRunInformations: Array<RunInformation>) -> YottaResult {
        let yottaResult = YottaResult()
        
        yottaResult.runInformations = runInformations
        yottaResult.countYotta = countYotta
        yottaResult.yottaRunInformations = yottaRunInformations
        
        return yottaResult
    }
    
    internal func setRunInformations(runInformations: Array<RunInformation>) {
        self.runInformations = runInformations
    }
    
    internal func setYottaRunInformations(yottaRunInformations: Array<RunInformation>) {
        self.yottaRunInformations = yottaRunInformations
    }
    
    internal func setCountYotta(countYotta: Int) {
        self.countYotta = countYotta
    }
    
    internal func getRunInformations() -> Array<RunInformation> {
        return self.runInformations
    }
    
    internal func getYottaRunInformations() -> Array<RunInformation> {
        return self.yottaRunInformations
    }
    
    internal func geetCountYotta() -> Int {
        return self.countYotta
    }

}