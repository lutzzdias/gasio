//
//  FuelEntry.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import Foundation

struct FuelEntry: Identifiable {
    let id = UUID()
    let liters: Double
    let mileage: Double
    let date: Date
    let fuelType: String
    
    var kmPerLiter: Double {
        return mileage / liters
    }
}
