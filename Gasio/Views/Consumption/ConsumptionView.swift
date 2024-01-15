//
//  GasView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI
import SwiftData

struct ConsumptionView: View {
    
    @Environment(\.modelContext) private var context
    
    /// Get entries from the database
    @Query(sort: [SortDescriptor(\FuelEntry.date, order: .reverse)], animation: .snappy) private var entries: [FuelEntry]
    
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(entries) { entry in
                    NavigationLink(destination: EntryDetailView(fuelEntry: entry)) {
                        EntryCardView(entry: entry)
                    }
                }
                .onDelete(perform: { indexSet in
                    let entry = entries[indexSet.first!]
                    context.delete(entry)
                })
            }
            .navigationTitle(Tabs.consumption.rawValue)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Add", systemImage: "plus") {
                        showingAddSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) { AddFuelEntryView() }
        }
    }
}

#Preview {
    ConsumptionView()
        .modelContainer(PreviewSampleData.container)
}
