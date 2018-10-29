//
//  ViewController.swift
//  testMap
//
//  Created by Katrina Shui on 10/16/18.
//  Copyright © 2018 Katrina Shui. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var geoFire: GeoFire!
    let locationManager = CLLocationManager()
    let regionInMeter: Double = 5000
    var geoFireRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        setDataBase()
        //showSightingsOnMap()
    }
    
    func setDataBase(){
        //Define GeoFire
        geoFireRef = Database.database().reference()
        geoFire = GeoFire(firebaseRef: geoFireRef)
        
    /*    geoFire.setLocation(CLLocation(latitude: 22.3968, longitude: 114.1099), forKey: "Tai Mo San")
        geoFire.setLocation(CLLocation(latitude: 22.3430, longitude: 114.1930), forKey: "Wong Tai Sin")
        geoFire.setLocation(CLLocation(latitude: 22.2759, longitude: 114.1455), forKey: "The Peak")
        geoFire.setLocation(CLLocation(latitude: 22.4445, longitude: 114.0222), forKey: "Yeun Long")
        geoFire.setLocation(CLLocation(latitude: 22.2467, longitude: 114.1757), forKey: "Ocean Park")
        geoFire.setLocation(CLLocation(latitude: 22.3204, longitude: 114.1698), forKey: "Mong Kok")
        geoFire.setLocation(CLLocation(latitude: 22.2988, longitude: 114.1722), forKey: "Tsim Sha Tsui")*/
        geoFire.setLocation(CLLocation(latitude: 22.4449, longitude: 114.0345), forKey: "Sun Yuen Long Center")
        
    }
    



}


