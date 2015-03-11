//
//  Provider.swift
//  ChangeUp
//
//  Created by Alex on 10/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

class Provider: NSObject {
    
    let name: String
    let rates: [Rate]
    
    init(name: String, rates: [Rate]) {
        self.name = name
        self.rates = rates
    }
}