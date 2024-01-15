//
//  CarAvatarView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 15/01/24.
//

import SwiftUI

struct CarAvatarView: View {
    let icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 250, height: 250)
                .foregroundColor(.accent)
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 175, height: 175)
        }
    }
}

#Preview {
    CarAvatarView(icon: SampleData.car.icon)
}
