//
//  EntryCardView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/01/24.
//

import SwiftUI
import SwiftData

struct EntryCardView: View {
    let entry: FuelEntry
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(entry.fuelType)
                    .fontWeight(.semibold)
                
                Text(entry.formattedDate)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(entry.formattedConsumption) + Text(" km/l").font(.caption)
        }
    }
}

#Preview {
    EntryCardView(entry: SampleData.entry)
        .modelContainer(for: [FuelEntry.self])
}
