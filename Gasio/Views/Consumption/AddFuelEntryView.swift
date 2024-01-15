//
//  AddFuelEntryView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import SwiftUI
import SwiftData

struct AddFuelEntryView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var entry: FuelEntry?
    
    @State private var fuelType: String = ""
    @State private var date: Date = .now
    @State private var liters: Double = .zero
    @State private var mileage: Double = .zero
    
    var body: some View {
        NavigationStack {
            Form {
                // TODO: Use picker of options created by user
                Section("FuelType") {
                    TextField("Common", text: $fuelType)
                }
                
                Section("Date") {
                    DatePicker("22/08/23", selection: $date, displayedComponents: .date)
                }
                
                // TODO: Allow empty value -> should show hint
                // TODO: Add suffix
                Section("Liters") {
                    TextField("13.4 l", value: $liters, formatter: NumberFormatter()).textFieldStyle(.plain)
                }
                
                Section("Mileage") {
                    TextField("132.3 km", value: $mileage, formatter: NumberFormatter())
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", action: save)
                }
            }

        }
        .onAppear(perform: {
            if let entry {
                fuelType = entry.fuelType
                date = entry.date
                liters = entry.liters
                mileage = entry.mileage
            }
        })
    }
    
    func save() {
        if (entry == nil){
            let newEntry = FuelEntry(liters: liters, mileage: mileage, date: date, fuelType: fuelType)
            context.insert(newEntry)
        } else {
            entry?.fuelType = fuelType
            entry?.date = date
            entry?.liters = liters
            entry?.mileage = mileage
        }
        dismiss()
    }
}

#Preview {
    let container = PreviewSampleData.container
    
    return NavigationStack { 
        AddFuelEntryView(entry: SampleData.entry)
            .modelContainer(container)
    }
}
