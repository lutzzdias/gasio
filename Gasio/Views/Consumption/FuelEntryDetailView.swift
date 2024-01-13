//
//  FuelEntryDetailView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import SwiftUI

struct FuelEntryDetailView: View {
    let fuelEntry: FuelEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fuelEntry.fuelType)
                .font(.title)
                .fontWeight(.bold)
            
            Text(fuelEntry.formattedDate)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack {
                Text("Mileage")
                    .bold()
                
                Spacer()
                
                Text("\(fuelEntry.formattedMileage) km")
            }
            .padding(.top)
            
            HStack {
                Text("Fuel")
                    .bold()
                
                Spacer()
                
                Text("\(fuelEntry.formattedLiters) liters")
            }
                
            VStack {
                Text("Consumption")
                    .font(.headline)
                
                Text("\(fuelEntry.formattedConsumption) km/l")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }.padding()
        }
        .padding(.horizontal)
    }
}

#Preview {
    FuelEntryDetailView(fuelEntry: fuelEntryMock)
}
