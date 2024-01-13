//
//  MainView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/12/23.
//

import SwiftUI

enum Tabs {
    case FUEL, HOME, CAR
}

struct MainView: View {
    @State var db = MockDB()
    
    var body: some View {
        TabView {
            ConsumptionView()
                .environment(db)
                .tabItem {
                    Label("Consumption", systemImage: "fuelpump").foregroundStyle(.accent)
                }
                .tag(Tabs.FUEL)
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tabs.HOME)
            
            CarView()
                .tabItem {
                    Label("Car", systemImage: "car")
                }
                .tag(Tabs.CAR)
        }
        .tint(.accent)
    }
}

#Preview {
    MainView()
}
