//
//  ContentView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 14/12/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("username") var username: String = ""
    
    var body: some View {
        VStack {
            Text(username)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
