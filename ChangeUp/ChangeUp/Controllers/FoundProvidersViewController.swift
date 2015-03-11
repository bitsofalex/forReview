//
//  FoundProvidersViewController.swift
//  ChangeUp
//
//  Created by Alex on 9/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit
import GoogleMaps

class FoundProvidersViewController: UIViewController, GMSMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var foundProvidersTableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = "Money Changers"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.configureMapView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureNavigation() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: Selector("dismissView"))
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = closeButton
    }
    
    func dismissView() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: {})
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func configureMapView() {
        self.mapView.camera = GMSCameraPosition.cameraWithLatitude(-33.868, longitude: 151.2086, zoom: 12)
        self.mapView.mapType = kGMSTypeNormal
        self.mapView.settings.compassButton = true
        self.mapView.delegate = self
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.foundProvidersTableView.dequeueReusableCellWithIdentifier("foundProvidersCell", forIndexPath: indexPath) as FoundProvidersTableViewCell
        cell.name.text = "UAExchange"
        cell.rate.text = "1.4324"
        cell.distance.text = "500m"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("toProviderDetailsViewController", sender: self)
    }

}
