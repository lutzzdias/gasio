//
//  CarEditView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 27/12/23.
//

import SwiftUI

struct CarEditView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("username") var username: String = ""
    
    var car: Car?
    
    @State private var name: String = ""
    @State private var brand: String = ""
    @State private var model: String = ""
    @State private var year: Int = .zero
    @State private var plate: String = ""
    @State private var mileage: Int = .zero
    
    private let currentYear: Int = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        NavigationStack {
            Form {
                Section("User") {
                    TextField("John Doe", text: $username)
                        .textContentType(.name)
                }
                
                Section("Car") {
                    TextField("McQueen", text: $name)
                        .autocorrectionDisabled(true)
                        .textContentType(.name)
                    
                    TextField("Toyota", text: $brand)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.words)
                    
                    TextField("Supra", text: $model)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.words)
                    
                    Picker("Year", selection: $year) {
                        ForEach(1900 ..< (currentYear + 1), id: \.self) { year in
                            Text(String(year)).tag(year)
                        }
                    }
                    
                    TextField("AAA0A00", text: $plate)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.characters)
                    
                    
                    TextField("1432 km", value: $mileage, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        car?.name = name
                        car?.brand = brand
                        car?.model = model
                        car?.year = year
                        car?.plate = plate
                        car?.mileage = mileage
                        dismiss()
                    }
                }
            }
            .onAppear(perform: {
                if let car {
                    name = car.name
                    brand = car.brand
                    model = car.model
                    year = car.year
                    plate = car.plate
                    mileage = car.mileage
                }
            })
        }
    }
}

#Preview {
    let container = PreviewSampleData.container
    
    return CarEditView(car: SampleData.car)
            .modelContainer(container)
}
