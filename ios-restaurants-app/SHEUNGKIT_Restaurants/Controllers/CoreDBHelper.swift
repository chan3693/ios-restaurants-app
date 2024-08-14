//
//  CoreDBHelper.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import Foundation
import CoreData

class CoreDBHelper : ObservableObject{
    
    @Published var restaurantList = [RestaurantMO]()
    
    private static var shared : CoreDBHelper?
    private let ENTITY_NAME = "RestaurantMO"
    private let moc : NSManagedObjectContext
    
    static func getInstance() -> CoreDBHelper{
        if shared == nil{
            shared = CoreDBHelper(moc: PersistenceController.preview.container.viewContext)
        }
        return shared!
    }//
    
    init(moc : NSManagedObjectContext){
        self.moc = moc
        let request = NSFetchRequest<RestaurantMO>(entityName: self.ENTITY_NAME)
        do{
            let count = try self.moc.count(for: request)
            if count == 0 {
                insertInitialData()
            }
        }catch let error as NSError{
            print(#function, "Could not fetch data from DB \(error)")
        }
    }
    
    func insertInitialData(){
        let initialData = [
            Restaurant(name: "Green Basil", latitude: 43.67194509399123, longitude: -79.29481045076973),
            Restaurant(name: "Garden State Restaurant", latitude: 43.67328970467347, longitude: -79.28743641138487),
            Restaurant(name: "ViVetha Bistro", latitude: 43.67445500956285, longitude: -79.28192137352565),
            Restaurant(name: "La Sala Restaurant", latitude: 43.67055563130399, longitude: -79.30038745534648),
            Restaurant(name: "Moti Mahal", latitude: 43.672931144770516, longitude: -79.3225715402185),
            Restaurant(name: "Uncle Betty's Diner", latitude: 43.71525069234152, longitude: -79.40050585666548)
            ]
        
        do{
            for restaurant in initialData{
                let restaurantToInsert = NSEntityDescription.insertNewObject(forEntityName: self.ENTITY_NAME, into: self.moc) as! RestaurantMO
                
                restaurantToInsert.name = restaurant.name
                restaurantToInsert.latitude = restaurant.latitude
                restaurantToInsert.longitude = restaurant.longitude
                
                if self.moc.hasChanges{
                    try self.moc.save()
                    print(#function, "Restaurants inserted successfully")
                }
            }
        }catch let error as NSError{
            print(#function, "Could not insert restaurant successfully \(error)")
        }
    }
    
    func getAllRestaurants(){
        let request = NSFetchRequest<RestaurantMO>(entityName: self.ENTITY_NAME)
        request.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do{
            let result = try self.moc.fetch(request)
            
            print(#function, "\(result.count) restaurants fetched from db")
            
            self.restaurantList = result
            
        }catch let error as NSError{
            print(#function, "Could not fetch data from DB \(error)")
        }
        
    }
    
}
