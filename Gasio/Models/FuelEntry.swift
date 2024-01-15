//
//  FuelEntry.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import Foundation
import SwiftData

@Model
class FuelEntry {
    var liters: Double
    var mileage: Double
    var date: Date
    var fuelType: String
    
    init(liters: Double, mileage: Double, date: Date, fuelType: String) {
        self.liters = liters
        self.mileage = mileage
        self.date = date
        self.fuelType = fuelType
    }
    
    var consumption: Double {
        return mileage / liters
    }
    
    // TODO: Remove all these formatted...
    var formattedConsumption: String {
        return String(format: "%.2f", consumption)
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    var formattedMileage: String {
        return String(format: "%.2f", mileage)
    }
    
    var formattedLiters: String {
        return String(format: "%.2f", liters)
    }
}
