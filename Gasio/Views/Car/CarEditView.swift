//
//  CarEditView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 27/12/23.
//

import SwiftUI

struct CarEditView: View {
    @Binding var car: Car
    @Binding var user: User
    
    var body: some View {
        Form {
            
            Section("User") {
                TextField("Name", text: $user.name)
            }
            
            Section("Car") {
                TextField("Name", text: $car.name)
                TextField("Brand", text: $car.brand)
                TextField("Model", text: $car.model)
                TextField("Year", value: $car.year, formatter: NumberFormatter())
                TextField("Plate", text: $car.plate)
                TextField("Mileage", value: $car.mileage, formatter: NumberFormatter())
            }
        }
    }
}

#Preview {
    CarEditView(car: .constant(Car.mock()), user: .constant(User.mock()))
}
