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
    
    func fetchUsers() {
        Task {
            do {
                let fetchedUsers = try await networkManager.fetchUsers()
                await updateUsers(fetchedUsers)
            } catch NetworkError.invalidURL {
                await showError("Invalid URL.")
            } catch NetworkError.decodingError {
                await showError("There was an error decoding.")
            } catch {
                await showError("An unexpected error occurred.")
            }
        }
    }
    
    @MainActor
    private func updateUsers(_ fetchedUsers: [User]) {
        self.users = fetchedUsers
    }
    
    @MainActor
    func saveUsers(modelContext: ModelContext) {
        for user in users {
            modelContext.insert(user)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save users: \(error).")
        }
    }
    
    @MainActor
    private func showError(_ message: String) {
        self.errorMessage = message
        self.showError = true
    }
}
