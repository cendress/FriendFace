//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Friend.self])
    }
}
