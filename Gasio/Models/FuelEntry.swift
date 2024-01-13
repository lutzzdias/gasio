//
//  FuelEntry.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import Foundation

struct FuelEntry: Identifiable, Hashable {
    let id = UUID()
    var liters: Double
    var mileage: Double
    var date: Date
    var fuelType: String
    
    var consumption: Double {
        return mileage / liters
    }
    
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
