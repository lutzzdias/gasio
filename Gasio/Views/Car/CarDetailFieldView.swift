//
//  CarDetailFieldView.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 27/12/23.
//

import SwiftUI

struct CarDetailFieldView: View {
    let title: String
    let content: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.quinary)
                .frame(maxWidth: .infinity, maxHeight: 60)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                Text(content)
            }.padding()
        }
    }
}

#Preview {
    CarDetailFieldView(title: "Title", content: "Content")
}
