//
//  SearchViewModel.swift
//  ChangeUp
//
//  Created by Alex on 3/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import Foundation
import CoreLocation

public protocol SearchViewModelDelegate: class {
    func updateBaseCurrencyCode()
}

class SearchViewModel: NSObject, CLLocationManagerDelegate, FxProviderServiceDelegate {
    
    let nsUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var baseCurrencyCode: String!
    let termsCurrencyCode: String!
    var amount: String?
    var quotedRate: String?
    
    weak var delegate: SearchViewModelDelegate?
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.initialiseBase()
    }
    
    private func initialiseBase() {
        // check NSUserDefaults
        if let defaultBase = nsUserDefaults.stringForKey("baseCurrencyCode") {
            self.baseCurrencyCode = defaultBase
        } else {
//            self.initializeCLLocation()
        }
    }
    
    private func initializeCLLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    private func handleGeocoding(placemarks: [AnyObject]!, error: NSError!) {
        if let placemark = placemarks[0] as? CLPlacemark {
            self.baseCurrencyCode = LocaleHelper.getCurrencyCodeFromCountryCode(placemark.ISOcountryCode)
            NSLog("Base currency code: " + self.baseCurrencyCode)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let locationsFound = locations {
            locationManager.stopUpdatingLocation()
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(manager.location, completionHandler: self.handleGeocoding)
        }
    }
    
    func validateBase() -> Bool{
        return !baseCurrencyCode.isEmpty
    }
    
    func validateTerms() -> Bool {
        return !termsCurrencyCode.isEmpty
    }
    
    func validateAmount() -> Bool {
        if let amountValue = (amount as NSString?)?.doubleValue {
            return isPositiveDouble(amountValue)
        }
        return true
    }
    
    func validateQuotedRate() -> Bool {
        if let quotedRateValue = (quotedRate as NSString?)?.doubleValue {
            return isPositiveDouble(quotedRateValue)
        }
        return true
    }
    
    func isPositiveDouble(value: Double) -> Bool {
        return value.isNormal && value > 0
    }
    
    func hasQuotedRate() -> Bool {
        return quotedRate?.utf16Count > 0 && validateQuotedRate()
    }
    
    func search() {
        let fxProviderService = FxProviderService()
        fxProviderService.delegate = self
        fxProviderService.getProviders(-37.814107, longitude: 144.96327999999994, radius: 1000)
    }
    
    func handleFxProviderResult(providers: [Provider]) {
        for p in providers {
            println(p.name)
        }
        NSLog("providers")
    }
}