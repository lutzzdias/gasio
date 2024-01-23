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
    var formattedConsumption: Double {
        return consumption.truncate(toDecimalPlaces: 2)
    }
    
    var formattedDate: String {
        return DateFormatter.format.string(from: date)
    }
    
    var formattedMileage: Double {
        return mileage.truncate(toDecimalPlaces: 2)
    }
    
    var formattedLiters: Double {
        return liters.truncate(toDecimalPlaces: 2)
    }
    
    static var latest: FetchDescriptor<FuelEntry> {
        var descriptor = FetchDescriptor<FuelEntry>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        descriptor.fetchLimit = 10
        return descriptor
    }

}
