//
//  AddFuelEntryView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import SwiftUI

struct AddFuelEntryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(MockDB.self) private var db
    
    @State private var fuelEntry = FuelEntry(liters: 0, mileage: 0, date: Date(), fuelType: "")
    
    var body: some View {
        Form {
            // TODO: Use picker of options created by user
            TextField("FuelType", text: $fuelEntry.fuelType)
            
            DatePicker("Date", selection: $fuelEntry.date, displayedComponents: .date)
            
            TextField("Liters", value: $fuelEntry.liters, formatter: NumberFormatter())
            
            TextField("Mileage", value: $fuelEntry.mileage, formatter: NumberFormatter())
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    db.fuelEntries.append(fuelEntry)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddFuelEntryView()
        .environment(MockDB())
}
