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
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(user.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(user.company)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text(user.email)
                    }
                    
                    HStack {
                        Image(systemName: "house.fill")
                            .foregroundColor(.green)
                        Text(user.address)
                    }
                    
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.purple)
                        Text("\(user.age) years old")
                    }
                    
                    ScrollView {
                        Text(user.about)
                            .font(.body)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Tags")
                        .font(.headline)
                    
                    Text(user.tags.joined(separator: ", "))
                        .padding(10)
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Friends")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(user.friends) { friend in
                                Text(friend.name)
                                    .padding(10)
                                    .background(Color.blue.opacity(0.2))
                                    .clipShape(Capsule())
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Details")
        }
    }
}

#Preview {
    let exampleUser = User(id: "id", name: "Christopher", age: 23, company: "MoodMe", email: "christopher@gmail.com", address: "912 Orange St., Baltimore MD", about: "An iOS developer that loves to build apps.", registered: Date.now, tags: ["movies", "outdoors", "meditation"], friends: [Friend(id: "id", name: "Fred")], isActive: true)
    
    return UserDetailView(user: exampleUser)
}
