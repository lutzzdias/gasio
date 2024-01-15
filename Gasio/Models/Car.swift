//
//  Car.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import Foundation
import SwiftData

@Model
class Car {
    var name: String
    var brand: String
    var model: String
    var year: Int
    var plate: String
    var mileage: Int
    var icon: String
    
    init(name: String, 
         brand: String,
         model: String,
         year: Int,
         plate: String,
         mileage: Int,
         icon: String) {
        self.name = name
        self.brand = brand
        self.model = model
        self.year = year
        self.plate = plate
        self.mileage = mileage
        self.icon = icon
    }
}


