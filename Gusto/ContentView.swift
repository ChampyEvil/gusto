//
//  ContentView.swift
//  Gusto
//
//  Created by ถิรวุฒิ ไชยชะอุ่ม on 18/1/2567 BE.
//

import SwiftUI

struct ContentView: View {

    let WokThisWay = Restaurant(name: "Wok this Way", priceRating: 1, qualityRating: 2, speedRating: 3)
    let ThymeSquare = Restaurant(name: "Thyme Square", priceRating: 2, qualityRating: 3, speedRating: 4)
    let PastaLaVista = Restaurant(name: "Pasta la Vista", priceRating: 2, qualityRating: 2, speedRating: 3)
    let LifeOfPie = Restaurant(name: "Life of Pie", priceRating: 4, qualityRating: 4, speedRating: 4)
    let LoadOfTheWings = Restaurant(name: "Load of the Wings", priceRating: 5, qualityRating: 5, speedRating: 5)
    @Environment(\.modelContext) var modelContext
    var body: some View {
        modelContext.insert(WokThisWay)
        modelContext.insert(ThymeSquare)
        modelContext.insert(PastaLaVista)
        modelContext.insert(LifeOfPie)
        modelContext.insert(LoadOfTheWings)
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }.toolbar {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
