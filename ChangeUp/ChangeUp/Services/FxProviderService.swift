//
//  FxProviderService.swift
//  ChangeUp
//
//  Created by Alex on 10/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol FxProviderServiceDelegate: class {
    func handleFxProviderResult(providers: [Provider])
}

class FxProviderService: NSObject {
    
    let baseUrl = "http://petit-dev.elasticbeanstalk.com/rest"
    let resource = "fxprovider"
    let requestUrl: String
    
    weak var delegate: FxProviderServiceDelegate?

    override init() {
        requestUrl = baseUrl + "/" + resource
    }
    
    func getProviders(latitude: Double, longitude: Double, radius: Double) {
        let params = ["lat": latitude, "lng": longitude, "radius": radius, "base": "AUD" as NSObject, "terms": "USD" as NSObject]
        request(.GET, requestUrl, parameters: params)
            .responseJSON { (request, response, data, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(request)
                    println(response)
                }
                else {
                    NSLog("Success: \(self.requestUrl)")
                    let jsonArray = JSON(data!).arrayValue
                    let branchGroup = jsonArray.map { b in b["fxProviderBranchGroup"] }
                    let branches = branchGroup.map { b in b["fxProviderBranches"] }
                    let providers = branches.map { d in Provider(name: d["name"].stringValue, rates: [Rate]()) }
                    self.delegate?.handleFxProviderResult(providers)
                }
            }
    }
    
    func test() {
        
    }
}