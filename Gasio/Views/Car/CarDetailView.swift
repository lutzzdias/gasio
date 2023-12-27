//
//  CarDetailView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 26/12/23.
//

import SwiftUI

struct CarDetailView: View {
    var body: some View {
        VStack {
            Image(systemName: "car.side.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Car name")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Car brand - Car model")
            
            Text("2023")
            
            Text("QAY0D46")
            
            Text("\(123_456) km")
        }
    }
}

#Preview {
    CarDetailView()
}
