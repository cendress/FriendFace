//
//  UsersViewModel.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation
import SwiftData

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var showError = false
    
    let networkManager = NetworkManager()
    
    func fetchUsers(modelContext: ModelContext) {
        Task {
            do {
                let fetchedUsers = try await networkManager.fetchUsers()
                await MainActor.run {
                    self.users = fetchedUsers
                    self.saveUsers(fetchedUsers, modelContext: modelContext)
                }
            } catch NetworkError.invalidURL {
                await MainActor.run {
                    self.errorMessage = "Invalid URL."
                    self.showError = true
                }
            } catch NetworkError.decodingError {
                await MainActor.run {
                    self.errorMessage = "There was an error decoding."
                    self.showError = true
                }
            }
        }
    }
    
    @MainActor
    private func saveUsers(_ users: [User], modelContext: ModelContext) {
        for user in users {
            modelContext.insert(user)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save users: \(error).")
        }
    }
}
