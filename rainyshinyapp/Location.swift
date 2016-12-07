//
//  Location.swift
//  rainyshinyapp
//
//  Created by Wellison Pereira on 7/30/16.
//  Copyright © 2016 Tora Cross. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
