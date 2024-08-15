//
//  LocationHelper.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import Foundation
import CoreLocation

class LocationHelper : NSObject, ObservableObject, CLLocationManagerDelegate{
    
    private let geoCoder = CLGeocoder()
    @Published var geoAddress : String = "fetching...."
    
    
    func performReverseGeocoding(location : CLLocation){
        
        self.geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            
            if (error != nil) {
                print(#function, "Unable to obtain address for given location : \(error)")
                self.geoAddress = "No matching address"
                return
            }else{
                if let place = placemarks?.first{
                    print(#function, "Matching place : \(place)")
                    
                    let street = place.thoroughfare ?? "NA"
                    let city = place.subLocality ?? "NA"
                    let postalCode = place.postalCode ?? "NA"
                    let country = place.country ?? "NA"
                    let province = place.administrativeArea ?? "NA"
                    
                    self.geoAddress = """
                        \(street). \(city)
                        \(postalCode). \(province). \(country)
                    """
                    return
                }
            }
        })
    }
}
