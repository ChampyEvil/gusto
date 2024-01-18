//
//  ContentView.swift
//  Gusto
//
//  Created by ถิรวุฒิ ไชยชะอุ่ม on 18/1/2567 BE.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) var modelContext

    @Query
    private var restaurants: [Restaurant]

    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")

                List {
                    ForEach (restaurants) { restaurant in
                        NavigationLink(("\(restaurant.name). \nOverall Rating is \((restaurant.priceRating + restaurant.qualityRating + restaurant.speedRating) / 3)"), value: restaurant)
                    }
                    .onDelete(perform: deleteRestaurant)
                }.navigationDestination(for: Restaurant.self) { restaurant in
                    @Bindable var restaurant: Restaurant = restaurant
                    Form {
                        TextField("Name of Restaurant", text: $restaurant.name)
                        TextField("Rating of price", value: $restaurant.priceRating, format: .number)
                        TextField("Rating of quality", value: $restaurant.qualityRating, format: .number)
                        TextField("Rating of speed", value: $restaurant.speedRating, format: .number)
                    }
                }
            }.toolbar {
                Button {
                    createRestaurant()
                } label: {
                    Label("Add Restaurant", systemImage: "plus")
                }
            }

        }
        .padding()
    }

    func createRestaurant() {
        let mockRestaurants = [
            Restaurant(name: "Wok this Way", priceRating: 1, qualityRating: 2, speedRating: 3),
            Restaurant(name: "Thyme Square", priceRating: 2, qualityRating: 3, speedRating: 4),
            Restaurant(name: "Pasta la Vista", priceRating: 2, qualityRating: 2, speedRating: 3),
            Restaurant(name: "Life of Pie", priceRating: 4, qualityRating: 4, speedRating: 4),
            Restaurant(name: "Load of the Wings", priceRating: 5, qualityRating: 5, speedRating: 5)
        ]

        modelContext.insert(mockRestaurants[0])
        modelContext.insert(mockRestaurants[1])
        modelContext.insert(mockRestaurants[2])
        modelContext.insert(mockRestaurants[3])
        modelContext.insert(mockRestaurants[4])
    }

    func deleteRestaurant(at offsets: IndexSet) {
        for item in offsets {
            let object = restaurants[item]
            modelContext.delete(object)
        }
    }
}

#Preview {
    ContentView()
}
