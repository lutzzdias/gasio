//
//  ContentView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 14/12/23.
//

import SwiftUI
import SwiftData
import Charts

struct HomeView: View {
    @Environment(\.calendar) var calendar
    @AppStorage("username") var username: String = ""
    @Query(sort: [SortDescriptor(\FuelEntry.date, order: .reverse)]) private var entries: [FuelEntry]
    
    @State var rawSelectedDate: Date? = nil
    
    var selectedElement: FuelEntry? {
        return entries.first { entry in
            if let rawSelectedDate {
                let comparisonResult = calendar.compare(entry.date, to: rawSelectedDate, toGranularity: .day)
                
                if comparisonResult == .orderedSame {
                    return true
                }
            }
            
            return false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if (!username.isEmpty) {
                Text("Welcome")
                    .font(.title)
                
                Text(username)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .leading) {
                ChartTitle()
                    .opacity(selectedElement == nil ? 1.0 : 0.0)
                
                Chart {
                    ForEach(entries.prefix(10)) { entry in
                        BarMark(x: .value("Date", entry.date, unit: .day),
                                y: .value("Consumption", entry.consumption)
                        )
                    }
                    
                    if let selectedElement {
                        RuleMark(x: .value("date", selectedElement.date))
                            .foregroundStyle(Color.gray.opacity(0.3))
                            .offset(y: -10)
                            .zIndex(-1)
                            .annotation(
                                position: .top, spacing: 0,
                                overflowResolution: .init(
                                    x: .fit(to: .chart),
                                    y: .disabled
                                )
                            ) { SelectionDetails() }
                    }
                }
                .chartXSelection(value: $rawSelectedDate)
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day, count: 7)) {
                        AxisTick()
                        AxisGridLine()
                        AxisValueLabel(format: .dateTime.month().day())
                    }
                }
                // TODO: Use chart gesture to set rawSelectedDate on tap instead of onHold
                .frame(maxHeight: 300)
                .padding()
            }
            
            // TODO: Line chart -> consumption based on the fuelType
            
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    func ChartTitle() -> some View {
        // TODO: Calculate average dinamically
        VStack(alignment: .leading) {
            Text("Average".uppercased())
                .font(.callout)
                .foregroundStyle(.secondary)
            
            HStack(alignment: .bottom, spacing: 4) {
                Text("14.42")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("km/L")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Text("25 Feb 2003")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
    
    @ViewBuilder
    func SelectionDetails() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Consumption".uppercased())
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .padding(.top, 2)
            
            HStack(alignment: .bottom, spacing: 4) {
                Text(String(selectedElement!.formattedConsumption))
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("km/L")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Text(selectedElement!.formattedDate)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.secondary)
                .padding(.bottom, 2)
        }
        .padding(.horizontal, 4)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.quinary)
        }
    }
}

#Preview {
    let container = PreviewSampleData.container
    
    return HomeView()
        .modelContainer(container)
}
