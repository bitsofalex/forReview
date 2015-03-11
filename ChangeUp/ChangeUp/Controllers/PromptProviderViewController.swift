//
//  PromptProviderViewController.swift
//  ChangeUp
//
//  Created by Alex on 9/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit

class PromptProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let viewModel: PromptProviderViewModel

    @IBOutlet weak var promptProviderTableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        self.viewModel = PromptProviderViewModel()
        super.init(coder: aDecoder)
        self.title = "Quote Provided By?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.promptProviderTableView.dequeueReusableCellWithIdentifier("promptProviderCell", forIndexPath: indexPath) as PromptProviderTableViewCell
//        let provider = viewModel.getProviders()[indexPath.row]
        cell.providerNameLabel.text = "Crazy Dan's Money Exchange"
        cell.providerContactLabel.text = "100 Queen Street, Melbourne, 3000"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("toProvidersViewController", sender: self)
    }
    
    func setSearchViewModel(searchViewModel: SearchViewModel) {
        self.viewModel.searchViewModel = searchViewModel
    }

    @IBAction func findAction(sender: AnyObject) {
        self.performSegueWithIdentifier("toProvidersViewController", sender: self)
    }
}
