//
//  FuelEntryDetailView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @State private var showingEditSheet = false
    
    let fuelEntry: FuelEntry
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(fuelEntry.fuelType)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(fuelEntry.formattedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                DetailRow(title: "Mileage", data: "\(fuelEntry.formattedMileage) km")
                    .padding(.top)
                
                DetailRow(title: "Fuel", data: "\(fuelEntry.formattedLiters) liters")
                    .padding(.bottom)
                
                LargeInfo(title: "Consumption", data: "\(fuelEntry.formattedConsumption) km/l")
                
                Spacer()
            }
            .padding(.horizontal)
            .toolbar {
                Button("Edit") {
                    showingEditSheet.toggle()
                }
            }
            .sheet(isPresented: $showingEditSheet) {
                AddFuelEntryView(entry: fuelEntry)
            }
        }
    }
    
    @ViewBuilder
    func DetailRow(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            Text(data)
        }
    }
    
    @ViewBuilder
    func LargeInfo(title: String, data: String) -> some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            Text(title)
                .font(.headline)
            
            Text(data)
                .font(.largeTitle)
                .fontWeight(.bold)
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    let container = PreviewSampleData.container
    
    return EntryDetailView(fuelEntry: SampleData.entry)
        .modelContainer(container)
}
