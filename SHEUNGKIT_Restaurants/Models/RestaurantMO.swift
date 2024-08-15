//
//  RestaurantMO.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import Foundation
import CoreData

@objc(RestaurantMO)
final class RestaurantMO : NSManagedObject, Identifiable{
    @NSManaged var id : UUID?
    @NSManaged var name : String
    @NSManaged var latitude : Double
    @NSManaged var longitude : Double
}

extension RestaurantMO{

    func displayRestaurant(){
        print(#function, "Restaurant information")
    }

}
