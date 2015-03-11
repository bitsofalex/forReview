//
//  LocaleHelper.swift
//  ChangeUp
//
//  Created by Alex on 5/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation

class LocaleHelper {
    
    class func getCurrencyCodeFromLocale() -> NSString {
        let locale = NSLocale.currentLocale()
        return locale.objectForKey(NSLocaleCurrencyCode) as NSString
    }
    
    class func getCurrencyCodeFromCountryCode(countryCode: NSString) -> NSString {
        let components = NSDictionary(object: countryCode, forKey: NSLocaleCountryCode)
        let localeIdentifier = NSLocale.localeIdentifierFromComponents(components)
        let locale = NSLocale(localeIdentifier: localeIdentifier)
        return locale.objectForKey(NSLocaleCurrencyCode) as NSString
    }
}
