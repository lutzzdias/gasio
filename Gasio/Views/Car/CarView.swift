//
//  MaintenanceView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI

struct CarView: View {
    
    @State private var isShowingEditView = false
    @State private var car: Car = Car.mock()
    @State private var user: User = User.mock()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 250, height: 250)
                            .foregroundColor(.accent)
                        
                        Image(systemName: car.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175, height: 175)
                    }
                    
                    Text(car.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Section {
                        CarDetailFieldView(title: "Brand", content: car.brand)
                        
                        CarDetailFieldView(title: "Model", content: car.model)
                        
                        CarDetailFieldView(title: "Year", content: "\(car.year)")
                        
                        CarDetailFieldView(title: "Plate", content: car.plate)
                        
                        CarDetailFieldView(title: "Mileage", content: "\(123_456) km")
                    }
                }
                .padding()
                .listStyle(.plain)
                .toolbar {
                    Button("Edit") {
                        isShowingEditView = true
                    }
                }
                .sheet(isPresented: $isShowingEditView) {
                    NavigationStack {
                        CarEditView(car: $car, user: $user)
                            .navigationTitle("Car name")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isShowingEditView = false
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isShowingEditView = false
                                    }
                                }
                            }
                    }
            }
            }
        }
    }
}

#Preview {
    CarView()
}
