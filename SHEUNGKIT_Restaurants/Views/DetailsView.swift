//
//  DetailsView.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import SwiftUI
import MapKit

struct DetailsView: View {
    
    let selectedRestaurantIndex : Int
    
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    @EnvironmentObject var locationHelper : LocationHelper
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        VStack{
            Text("\(coreDBHelper.restaurantList[self.selectedRestaurantIndex].name)")
                .font(.title2)
                .padding()
            Map(coordinateRegion: self.$region, annotationItems: [coreDBHelper.restaurantList[self.selectedRestaurantIndex]]) {
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)) {
                    Text("\(self.locationHelper.geoAddress)")
                    Image(systemName: "mappin")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
        }//VStack
        .navigationTitle("Restaurant Details")
        .onAppear{
            let selectedRestaurant = coreDBHelper.restaurantList[selectedRestaurantIndex]
            self.locationHelper.performReverseGeocoding(location: CLLocation(latitude: selectedRestaurant.latitude, longitude: selectedRestaurant.longitude))
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: selectedRestaurant.latitude, longitude: selectedRestaurant.longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        }
    }
}
