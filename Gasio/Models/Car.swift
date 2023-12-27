//
//  Car.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import Foundation

struct Car: Identifiable {
    let id = UUID()
    var name: String
    var brand: String
    var model: String
    var year: Int
    var plate: String
    var mileage: Int
    var icon: String
}

extension Car {
    static func mock() -> Car {
        return Car(name: "Fiote", brand: "BMW", model: "320i", year: 2024, plate: "QAY0D46", mileage: 15, icon: "car.side.fill")
    }
}
