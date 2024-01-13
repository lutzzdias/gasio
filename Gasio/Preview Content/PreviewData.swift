//
//  PreviewData.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import Foundation

var userMock = User(name: "Thiago Lütz Dias")

var carMock = Car(name: "Fiote",
                   brand: "BMW",
                   model: "320i",
                   year: 2024,
                   plate: "QAY0D46",
                   mileage: 15,
                   icon: "car.side.fill")

var fuelEntryMock = FuelEntry(liters: 16.3, mileage: 45.2, date: Date(), fuelType: "Gasolina Comum")

var fuelEntriesMock = [
    FuelEntry(liters: 16.3, mileage: 45.2, date: Date(), fuelType: "Gasolina Comum"),
    FuelEntry(liters: 30, mileage: 107.8, date: Date(), fuelType: "Etanol"),
    FuelEntry(liters: 22.2, mileage: 73, date: Date(), fuelType: "Gasolina Aditivada"),
    FuelEntry(liters: 7, mileage: 42, date: Date(), fuelType: "Gasolina Comum"),
    FuelEntry(liters: 25, mileage: 83.1, date: Date(), fuelType: "Gasolina Aditivada")
]
