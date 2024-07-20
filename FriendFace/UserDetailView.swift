//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("\(user.about)")
                    .padding()
                
                Text("Tags")
                    .font(.headline)
                Text(user.tags.joined(separator: ", "))
                
                Text("Friends")
                    .font(.headline)
                
                List(user.friends) { friend in
                    Text(friend.name)
                }
            }
            .padding()
            .navigationTitle(user.name)
        }
    }
}

#Preview {
    let exampleUser = User(id: "id", name: "Christopher", age: 23, company: "MoodMe", email: "christopher@gmail.com", address: "912 Orange St., Baltimore MD", about: "An iOS developer that loves to build apps.", registered: Date.now, tags: ["movies", "outdoors", "meditation"], friends: [Friend(id: "id", name: "Fred")], isActive: true)
    
    return UserDetailView(user: exampleUser)
}
