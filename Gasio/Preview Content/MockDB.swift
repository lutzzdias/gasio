//
//  MockDB.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 13/01/24.
//

import Foundation

@Observable
class MockDB {
    var fuelEntries = fuelEntriesMock
    var user = userMock
    var car = carMock
}
