//
//  User.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation

struct User: Codable, Identifiable {
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
}

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}
