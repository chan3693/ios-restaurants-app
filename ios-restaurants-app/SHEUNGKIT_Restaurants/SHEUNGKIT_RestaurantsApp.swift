//
//  SHEUNGKIT_RestaurantsApp.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import SwiftUI

@main
struct SHEUNGKIT_RestaurantsApp: App {
    
    let coreDBHelper = CoreDBHelper(moc: PersistenceController.shared.container.viewContext)
    let locationHelper = LocationHelper()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(coreDBHelper)
                .environmentObject(locationHelper)
        }
    }
}
