//
//  Double.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 23/01/24.
//

import Foundation

extension Double {
    func truncate(toDecimalPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
