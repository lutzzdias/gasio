//
//  GasView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI

struct ConsumptionView: View {
    
    private let entries = fuelEntriesMock
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(entries) {entry in
                    HStack {
                        VStack {
                            Text("\(entry.kmPerLiter)")
                        }
                    }
                }
            }
            .navigationTitle("Consumption")
        }
    }
}

#Preview {
    ConsumptionView()
}
