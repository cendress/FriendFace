//
//  User.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let friends: [Friend]
}

struct Friend: Codable, Identifiable {
    var id = UUID()
    var name: String
}
