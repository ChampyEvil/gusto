//
//  Restaurant.swift
//  Gusto
//
//  Created by ถิรวุฒิ ไชยชะอุ่ม on 18/1/2567 BE.
//

import Foundation
import SwiftData

@Model
class Restaurant {
    var name: String
    var priceRating: Int
    var qualityRating: Int
    var speedRating: Int

    init(name: String, priceRating: Int, qualityRating: Int, speedRating: Int) {
        self.name = name
        self.priceRating = priceRating
        self.qualityRating = qualityRating
        self.speedRating = speedRating
    }
}
