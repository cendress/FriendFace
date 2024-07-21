//
//  UsersViewModel.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation
import SwiftData
import SwiftUI

class UsersViewModel: ObservableObject {
    @Environment(\.modelContext) var modelContext
    
    @Published var users: [User] = []
    @Published var errorMessage: String?
    @Published var showError = false
    
    let networkManager = NetworkManager()
    
    func fetchUsers() {
        Task {
            do {
                let fetchedUsers = try await networkManager.fetchUsers()
                DispatchQueue.main.async {
                    self.users = fetchedUsers
                }
            } catch NetworkError.invalidURL {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid URL."
                    self.showError = true
                }
            } catch NetworkError.decodingError {
                DispatchQueue.main.async {
                    self.errorMessage = "There was an error decoding."
                    self.showError = true
                }
            }
        }
    }
    
    private func saveUsers() {
        for user in users {
            modelContext.insert(user)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to save users.")
        }
    }
}
