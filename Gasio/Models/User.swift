//
//  User.swift
//  Gasio
//
//  Created by Thiago Lütz Dias on 27/12/23.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
}

extension User {
    static func mock() -> User {
        return User(name: "Thiago Lütz Dias")
    }
}
