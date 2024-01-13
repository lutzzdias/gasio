//
//  PreviewData.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import Foundation

let userMock = User(name: "Thiago Lütz Dias")

let carMock = Car(name: "Fiote",
                   brand: "BMW",
                   model: "320i",
                   year: 2024,
                   plate: "QAY0D46",
                   mileage: 15,
                   icon: "car.side.fill")

let fuelEntryMock = FuelEntry(liters: 16.3, mileage: 45.2, date: Date(), fuelType: "Gasolina Comum")

let fuelEntriesMock = [FuelEntry](repeating: fuelEntryMock, count: 10)
