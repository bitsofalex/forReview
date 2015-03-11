//
//  SelectCurrencyViewModel.swift
//  ChangeUp
//
//  Created by Alex on 7/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

public protocol SelectCurrencyViewModelDelegate: class {
    
}

class SelectCurrencyViewModel: NSObject {
    
    private var currencies: [Currency] = []
    
    var filter: String
    
    weak var delegate: SelectCurrencyViewModelDelegate?
    
    override init() {
        self.filter = ""
        super.init()
        self.loadCurrencyCodes()
    }
    
    func getCurrencies() -> [Currency] {
        let searchText = filter.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if searchText.utf16Count > 0 {
            return currencies.filter { c in
                c.getCurrencyDescription().rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil, locale: nil) != nil
            }
        }
        return currencies;
    }
    
    private func loadCurrencyCodes() {
        let filePath = NSBundle.mainBundle().pathForResource("currencies", ofType: "json")
        var readError:NSError?
        if let data = NSData(contentsOfFile:filePath!, options:NSDataReadingOptions.DataReadingUncached, error:&readError) {
            let json: [NSDictionary]! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as [NSDictionary]
            currencies = json.map { c in
                Currency(currencyCode: c["code"] as String, name: c["name"] as String)
            }
        }
    }
}