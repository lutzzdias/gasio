//
//  MaintenanceView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI
import SwiftData

struct CarView: View {
    @Environment(\.modelContext) var context
    
    @Query var cars: [Car]
    var car: Car { 
        // TODO: Make user save car on first entry
        if cars.isEmpty {
            context.insert(SampleData.car)
        }
        return cars.first ?? SampleData.car
    }
    
    @State private var showingEditSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    
                    CarAvatarView(icon: car.icon)
                    
                    Text(car.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Section {
                        CarDetailFieldView(title: "Brand", content: car.brand)
                        
                        CarDetailFieldView(title: "Model", content: car.model)
                        
                        CarDetailFieldView(title: "Year", content: "\(car.year)")
                        
                        CarDetailFieldView(title: "Plate", content: car.plate)
                        
                        CarDetailFieldView(title: "Mileage", content: "\(car.mileage) km")
                    }
                }
                .padding()
                .toolbar {
                    Button("Edit") {
                        showingEditSheet.toggle()
                    }
                }
                .sheet(isPresented: $showingEditSheet) {
                    CarEditView(car: car)
                }
            }
        }
    }
}

#Preview {
    CarView()
}
