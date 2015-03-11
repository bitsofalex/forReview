//
//  Currency.swift
//  ChangeUp
//
//  Created by Alex on 7/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

class Currency {
    
    let currencyCode: String
    let name: String
    
    init(currencyCode: String, name: String) {
        self.currencyCode = currencyCode
        self.name = name
    }
    
    func getCurrencyDescription() -> String {
        return currencyCode + " " + name
    }
}