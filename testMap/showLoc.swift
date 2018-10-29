//
//  showLoc.swift
//  testMap
//
//  Created by Katrina Shui on 10/16/18.
//  Copyright © 2018 Katrina Shui. All rights reserved.
//

import UIKit
import Firebase
import MapKit

extension ViewController: MKMapViewDelegate{
    
    //func that add notation in map & searching the location of user and the corresponding area
    func showSightingsOnMap(location: CLLocation) {
        if let circleQuery = geoFire?.query(at: location, withRadius: 30) {
            
            _ = circleQuery.observe(GFEventType.keyEntered, with: { (key, location) in
                
                //let key = key, let location = location {
                let anno = RoomPin(roomName: key, roomChara: key, location: location.coordinate)
                self.mapView.addAnnotation(anno)
                //  }
            })
        }
        
        
      /*  let location = CLLocationCoordinate2D(latitude: 22.3968, longitude: 114.1099)
        let pin = RoomPin(roomName: "Beauty and Bee", roomChara: "Can you guess what it is", location: location)
        self.mapView.addAnnotation(pin)*/
        
    }
    
    
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView!
        let annoIdentifer = "Room"
    
        //define image of the user
        if annotation is MKUserLocation{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView.image = UIImage(named:"duckk")
        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifer){
           annotationView = deqAnno
           annotationView.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifer)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
    
    if let annotationView = annotationView, let anno = annotation as? RoomPin {
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "pin")
    }
    
     /*   //define image of the pin location (other added location in map)
        annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custommanotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true */
        return annotationView
        
    }
    
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        showSightingsOnMap(location: loc)
    }
    
}
