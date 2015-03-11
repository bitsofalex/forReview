//
//  SearchViewController.swift
//  ChangeUp
//
//  Created by Alex on 3/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController, UITextFieldDelegate, SearchViewModelDelegate, SelectCurrencyProtocol {
    
    let viewModel: SearchViewModel
    
    weak var selectCurrencyTarget: UIButton?
    
    @IBOutlet weak var selectBaseButton: UIButton!
    
    @IBOutlet weak var selectTermsButton: UIButton!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var quotedRateTextField: UITextField!

    @IBOutlet weak var searchButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        self.viewModel = SearchViewModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureButtons()
        self.configureObservations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configureButtons() {
        let brandColor = UIColor(red: CGFloat(20) / 255.0, green: CGFloat(221) / 255.0, blue: CGFloat(179) / 255.0, alpha: 1.0).CGColor
        
        selectBaseButton.layer.borderColor = brandColor
        selectBaseButton.layer.borderWidth = 1.0
        selectBaseButton.layer.cornerRadius = 4
        
        selectTermsButton.layer.borderColor = brandColor
        selectTermsButton.layer.borderWidth = 1.0
        selectTermsButton.layer.cornerRadius = 4
    }
    
    func updateBaseCurrencyCode() {
        self.selectBaseButton.setTitle(viewModel.baseCurrencyCode, forState: UIControlState.Normal)
    }
    
    func updateSelectedCurrency(currency: Currency) {
        self.selectCurrencyTarget?.setTitle(currency.currencyCode, forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSelectCurrencyViewController") {
            if let selectCurrencyViewController = segue.destinationViewController as? SelectCurrencyViewController {
                selectCurrencyViewController.delegate = self
                selectCurrencyTarget = sender as? UIButton
                if let label = selectCurrencyTarget!.titleLabel {
                    if let selectedCurrency = label.text {
                        selectCurrencyViewController.setSelectedCurrency(selectedCurrency)
                    }
                }
            }
        } else if (segue.identifier == "toPromptProviderVIewController") {
            if let promptProviderViewController = segue.destinationViewController as? PromptProviderViewController {
                promptProviderViewController.setSearchViewModel(viewModel.copy() as SearchViewModel)
            }
        }
    }
    
    func configureObservations() {
        self.viewModel.delegate = self
        self.amountTextField.delegate = self
        self.quotedRateTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func selectBaseAction(sender: AnyObject) {
        NSLog("selectBaseButton pressed")
    }
    
    @IBAction func selectTermsAction(sender: AnyObject) {
        NSLog("selectTermsButton pressed")
    }
    
    @IBAction func searchAction(sender: AnyObject) {
        NSLog("searchButton pressed")
        viewModel.search()
        viewModel.amount = amountTextField.text
        viewModel.quotedRate = quotedRateTextField.text
        if (viewModel.hasQuotedRate()) {
            self.performSegueWithIdentifier("toPromptProviderViewController", sender: self)
        } else {
            self.performSegueWithIdentifier("toProvidersViewController", sender: self)
        }
    }

    @IBAction func selectBaseCurrencyAction(sender: AnyObject) {
        self.performSegueWithIdentifier("toSelectCurrencyViewController", sender: sender)
    }
    
    @IBAction func selectTermsCurrencyAction(sender: AnyObject) {
        self.performSegueWithIdentifier("toSelectCurrencyViewController", sender: sender)
    }
}
