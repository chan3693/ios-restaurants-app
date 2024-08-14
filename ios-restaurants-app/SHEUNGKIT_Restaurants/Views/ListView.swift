//
//  ListView.swift
//  SHEUNGKIT_Restaurants
//
//  Created by Simon Chan on 2024-07-05.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                List{
                    ForEach(self.coreDBHelper.restaurantList.enumerated().map({$0}), id: \.element.self){index, currentRestaurant in
                        NavigationLink(destination: DetailsView(selectedRestaurantIndex: index)){
                            VStack(alignment: .leading){
                                Text("\(currentRestaurant.name)")
                                    .fontWeight(.bold)
                            }//VStack
                        }//NavigationLink
                    }//ForEach
                }//ListEnd
            }//ZStack
            .navigationTitle("SHEUNGKIT_Restaurant")
        }//NavigationStack
        .onAppear(){
            self.coreDBHelper.getAllRestaurants()
        }
    }
}

struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
