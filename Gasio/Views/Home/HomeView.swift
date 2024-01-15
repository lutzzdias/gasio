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
    @AppStorage("username") var username: String = ""
    @Query(sort: [SortDescriptor(\FuelEntry.date, order: .reverse)]) private var entries: [FuelEntry]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .font(.title)
            
            Text(username)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Chart {
                ForEach(entries) { entry in
                    BarMark(x: .value("Date", entry.date),
                            y: .value("Consumption", entry.consumption))
                    .position(by: .value("Consumption", entry.consumption))
                }
            }
            .frame(maxHeight: 300)
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
