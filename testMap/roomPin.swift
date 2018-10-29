//
//  roomPin.swift
//  testMap
//
//  Created by Katrina Shui on 10/16/18.
//  Copyright © 2018 Katrina Shui. All rights reserved.
//

import Foundation
import MapKit

class RoomPin: NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(roomName:String, roomChara:String, location:CLLocationCoordinate2D){
            self.title = roomName
            self.subtitle = roomChara
            self.coordinate = location
    }
}
