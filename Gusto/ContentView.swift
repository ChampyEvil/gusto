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

    @State
    private var goToAddRestaurant = false
    @State
    private var path = [Restaurant]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    ForEach (restaurants) { restaurant in
                        NavigationLink(value: restaurant) {
                            VStack {
                                HStack {
                                    Text("Name")
                                    Spacer()
                                    Text(restaurant.name)
                                }
                                HStack {
                                    Text("Price Rating")
                                    Spacer()
                                    Text("\(restaurant.priceRating)")
                                }
                                HStack {
                                    Text("Quality Rating")
                                    Spacer()
                                    Text("\(restaurant.qualityRating)")
                                }
                                HStack {
                                    Text("Speed Rating")
                                    Spacer()
                                    Text("\(restaurant.speedRating)")
                                }
                                HStack {
                                    Text("Overall")
                                    Spacer()
                                    Text("\((restaurant.priceRating + restaurant.qualityRating + restaurant.speedRating) / 3)")
                                }
                            }
                        }
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
                    let restaurant = Restaurant(name: "", priceRating: 0, qualityRating: 0, speedRating: 0)
                    modelContext.insert(restaurant)
                    path.append(restaurant)
                } label: {
                    Label("Add Restaurant", systemImage: "plus")
                }
            }
        }
        .padding()
    }

    func updateRestaurant(newRestaurant: Restaurant) {
        modelContext.insert(newRestaurant)
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
