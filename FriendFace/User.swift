//
//  User.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation
import SwiftData

@Model
class User {
    let id: String
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    let isActive: Bool
    
    init(id: String, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend], isActive: Bool) {
        self.id = id
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
        self.isActive = isActive
    }
}

@Model
class Friend {
    let id: String
    let name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
