//
//  DateFormatter.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 23/01/24.
//

import Foundation

extension DateFormatter {
    static var format: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }
}
