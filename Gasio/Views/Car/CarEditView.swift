//
//  CarEditView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 27/12/23.
//

import SwiftUI

struct CarEditView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var car: Car
    @Binding var user: User
    
    private let currentYear: Int = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        Form {
            Section("User") {
                TextField("username", text: $user.name, prompt: Text("Name"))
            }
            
            Section("Car") {
                TextField("Name", text: $car.name)
                    .autocorrectionDisabled(true)
                    .textContentType(.name)
                
                TextField("Brand", text: $car.brand)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                
                TextField("Model", text: $car.model)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                
                Picker("Year", selection: $car.year) {
                    ForEach(1900 ..< (currentYear + 1), id: \.self) { year in
                        Text(String(year)).tag(year)
                    }
                }
                
                TextField("Plate", text: $car.plate)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.characters)
                
                
                TextField("Mileage", value: $car.mileage, formatter: NumberFormatter())
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
                Button("Done") {
                    // context.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    CarEditView(car: .constant(carMock), user: .constant(userMock))
}
