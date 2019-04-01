//
//  LocationViewController.swift
//  GoogleMapsPlacesTask
//
//  Created by Nikhil Patil on 30/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class LocationViewController: UIViewController {

    @IBOutlet weak var googleMapsLocation: GMSMapView!
    
    var marker:GMSMarker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackBtnTap(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
