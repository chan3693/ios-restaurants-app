//
//  Persistence.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import Foundation
import CoreData

struct PersistenceController{
    
    static let shared = PersistenceController()
    let container : NSPersistentContainer
    
    static var preview : PersistenceController = {
        let result = PersistenceController(inMemory : true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    init(inMemory : Bool = false){
        self.container = NSPersistentContainer(name: "RestaurantModel")
        
        if inMemory{
            self.container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        self.container.loadPersistentStores(completionHandler: { (storeDescription , error) in
            if let error = error as NSError?{
                print(#function, "Unable to connect to CoreData : \(error)")
            }
        })
    }
}
