//
//  ContentView.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UsersViewModel()
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.company)
                            }
                            
                            Spacer()
                            
                            Circle()
                                .foregroundStyle(user.isActive ? .green : .red)
                                .frame(width: 10, height: 10)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers(modelContext: modelContext)
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "An unexpected error occurred."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
