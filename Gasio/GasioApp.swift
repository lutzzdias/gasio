//
//  GasioApp.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 14/12/23.
//

import SwiftUI
import SwiftData

@main
struct GasioApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [Car.self, FuelEntry.self])
    }
}
