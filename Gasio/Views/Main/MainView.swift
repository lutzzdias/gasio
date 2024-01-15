//
//  MainView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI

enum Tabs: String {
    case consumption = "Consumption"
    case home = "Home"
    case car = "Car"
    
    @ViewBuilder
    var content: some View {
        switch self{
        case .consumption:
            Label(self.rawValue, systemImage: "fuelpump")
        case .home:
            Label(self.rawValue, systemImage: "house")
        case .car:
            Label(self.rawValue, systemImage: "car")
        }
    }
}

struct MainView: View {
    var body: some View {
        TabView {
            ConsumptionView()
                .tabItem { Tabs.consumption.content }
                .tag(Tabs.consumption)
            
            HomeView()
                .tabItem { Tabs.home.content }
                .tag(Tabs.home)
            
            CarView()
                .tabItem { Tabs.car.content }
                .tag(Tabs.car)
        }
        .tint(.accent)
    }
}

#Preview {
    MainView()
}
