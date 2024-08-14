//
//  Restaurant.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import Foundation

struct Restaurant : Codable, Hashable{
    var name : String = ""
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
