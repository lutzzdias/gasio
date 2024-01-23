//
//  PreviewData.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import SwiftUI
import SwiftData

actor PreviewSampleData {
    @MainActor
    static var container: ModelContainer = {
        let schema = Schema([Car.self, FuelEntry.self])
        let configuration = ModelConfiguration("preview-container", schema: schema, isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: configuration)
        
        SampleData.entries.forEach {
            container.mainContext.insert($0)
        }
        
        return container
    }()
}

struct SampleData {
    static var entry = FuelEntry(liters: 16.3, mileage: 45.2, date: Date(), fuelType: "Gasolina Comum")
    
    static var entries = [
        FuelEntry(liters: 16.3, mileage: 45.2, date: Date().advanced(by: 10000), fuelType: "Gasolina Comum"),
        FuelEntry(liters: 30, mileage: 107.8, date: Date().advanced(by: 100000), fuelType: "Etanol"),
        FuelEntry(liters: 22.2, mileage: 73, date: Date().advanced(by: 17000), fuelType: "Gasolina Aditivada"),
        FuelEntry(liters: 7, mileage: 42, date: Date().advanced(by: 1000000), fuelType: "Gasolina Comum"),
        FuelEntry(liters: 25, mileage: 83.1, date: Date().advanced(by: 1000500), fuelType: "Gasolina Aditivada")
    ]
    
    static var car = Car(name: "Name", brand: "Brand", model: "Model", year: 2000, plate: "PLATE", mileage: 0, icon: "car.side.fill")
}
