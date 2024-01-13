//
//  GasView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI

struct ConsumptionView: View {
    
    @Environment(MockDB.self) private var db
    
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(db.fuelEntries) {entry in
                    NavigationLink(value: entry) {
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
                .onDelete(perform: deleteEntry)
            }
            .navigationTitle("Consumption")
            .navigationDestination(for: FuelEntry.self) { entry in
                FuelEntryDetailView(fuelEntry: entry)
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showingAddSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                NavigationStack {
                    AddFuelEntryView()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("New fuel entry")
                }
            }
        }
    }
    
    func deleteEntry(_ indexSet: IndexSet) {
        db.fuelEntries.remove(atOffsets: indexSet)
    }
}

#Preview {
    ConsumptionView()
        .environment(MockDB())
}
