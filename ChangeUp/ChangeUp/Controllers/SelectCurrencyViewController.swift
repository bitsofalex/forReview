//
//  SelectCurrencyViewController.swift
//  ChangeUp
//
//  Created by Alex on 6/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit

protocol SelectCurrencyProtocol: class {
    func updateSelectedCurrency(currency: Currency)
}

class SelectCurrencyViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, SelectCurrencyViewModelDelegate {

    @IBOutlet weak var currencySearchBar: UISearchBar!
    
    @IBOutlet weak var currencyTableView: UITableView!
    
    weak var delegate: SelectCurrencyProtocol?
    
    private var selectedCurrency: String?
    
    private var viewModel: SelectCurrencyViewModel
    
    required init(coder aDecoder: NSCoder) {
        self.viewModel = SelectCurrencyViewModel()
        super.init(coder: aDecoder)
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currencyTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setSelectedCurrency(selectedCurrency: String) {
        self.selectedCurrency = selectedCurrency
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        currencyTableView.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filter = searchText
        currencyTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getCurrencies().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.currencyTableView.dequeueReusableCellWithIdentifier("currencyCell", forIndexPath: indexPath) as CurrencyTableViewCell
        let currency = viewModel.getCurrencies()[indexPath.row]
        
        var countryCode = (currency.getCurrencyDescription() as NSString).substringToIndex(2)
        countryCode = countryCode == "AN" ? "NL" : countryCode
        
        // TODO add an icon to indicate the current selected currency and remove *
        cell.currencyDescription.text = selectedCurrency == currency.currencyCode ?
            "* " + currency.getCurrencyDescription() : currency.getCurrencyDescription()
        
        let filePath = NSBundle.mainBundle().pathForResource(countryCode, ofType: "png")
        if let flagPath = filePath {
            cell.currencyFlag.image = UIImage(contentsOfFile: flagPath)
        } else {
            cell.currencyFlag.image = nil
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedIndex = indexPath.row
        delegate?.updateSelectedCurrency(viewModel.getCurrencies()[selectedIndex])
    }
}
