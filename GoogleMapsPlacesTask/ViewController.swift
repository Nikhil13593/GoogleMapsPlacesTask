//
//  ViewController.swift
//  GoogleMapsPlacesTask
//
//  Created by Nikhil Patil on 27/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var googleMapView:GMSMapView!
    var marker:GMSMarker!
    
    var image:[UIImage]!
    var placeName:[String]!
    var country:[String]!
    var latitudes:[String]!
    var longitudes:[String]!
    
    var latitudeVaule:[Double]!
    var longitudeVaule:[Double]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wondersOfWorld()
        
        latitudeVaule = [40.4319,-13.1631,41.8902,27.1750,-22.9519,30.3285,20.6843]
        longitudeVaule = [116.5704,-72.5450,12.4922,78.0422,-43.2105,35.444,-88.5678]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func wondersOfWorld()
    {
        
        image = [#imageLiteral(resourceName: "Great Wall of China"),#imageLiteral(resourceName: "machu picchu"),#imageLiteral(resourceName: "Colosseum"),#imageLiteral(resourceName: "Taj Mahal"),#imageLiteral(resourceName: "Christ the Reedemer Statue"),#imageLiteral(resourceName: "Petra"),#imageLiteral(resourceName: "Chichén Itzá")]
        
        placeName = ["The Great Wall of China","Machu Picchu","Roman Colosseum","Taj Mahal","Christ the Reedemer Statue","Petra ","Chichén Itzá "]
        country = ["CHINA","PERU","ITALY","INDIA","BRAZIL","JORDAN","MEXICO"]
        latitudes = ["40.4319°Latitude","-13.1631°Latitude","41.8902°Latitude","27.1750°Latitude","-22.9519°Latitude","30.3285°Latitude","20.6843°Latitude"]
        longitudes = ["116.5704°Longitude","-72.5450°Longitude","12.4922°Longitude","78.0422°Longitude","-43.2105°Longitude","35.444°Longitude","-88.5678°Longitude"]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.placeImage.image = image[indexPath.row]
        cell.placeNameLbl.text = placeName[indexPath.row]
        cell.countryLbl.text = country[indexPath.row]
        cell.latitudeLbl.text = latitudes[indexPath.row]
        cell.longitudeLbl.text = longitudes[indexPath.row]
        
//        cell.backgroundView = UIImageView(image: UIImage(named: "Cell"))
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 420
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let locationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
        
        self.present(locationVC, animated: true) {
            
            locationVC.marker = GMSMarker()
            locationVC.marker.position = CLLocationCoordinate2D(latitude: self.latitudeVaule[indexPath.row], longitude: self.longitudeVaule[indexPath.row])
            locationVC.marker.map = locationVC.googleMapsLocation
            locationVC.marker.title = self.placeName[indexPath.row]
            locationVC.marker.snippet = self.country[indexPath.row]
            //locationVC.marker.icon = self.image[indexPath.row]
            
            
            
            let camera = GMSCameraPosition(latitude: self.latitudeVaule[indexPath.row], longitude: self.longitudeVaule[indexPath.row], zoom: 20)
            locationVC.googleMapsLocation.camera = camera
        }
        
    }
    
    @IBAction func onAddBtnTap(_ sender: UIBarButtonItem) {
        
        let addLocationVC = self.storyboard?.instantiateViewController(withIdentifier: "AddLocationViewController") as! AddLocationViewController
        
        self.present(addLocationVC, animated: true) {
            
        }
        
    }

}

