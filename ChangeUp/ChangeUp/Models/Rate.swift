//
//  Rate.swift
//  ChangeUp
//
//  Created by Alex on 10/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

class Rate: NSObject {
    
    let base: Currency
    let terms: Currency
    let ask: Double
    let bid: Double
    
    init(base: Currency, terms: Currency, bid: Double, ask: Double) {
        self.base = base
        self.terms = terms
        self.bid = bid
        self.ask = ask
    }
}