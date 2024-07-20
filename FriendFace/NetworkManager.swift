//
//  NetworkManager.swift
//  FriendFace
//
//  Created by Christopher Endress on 7/20/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
}

class NetworkManager {
    func fetchUsers() async throws -> [User] {
        let url = "https://www.hackingwithswift.com/samples/friendface.json"
        
        guard let url = URL(string: url) else { throw NetworkError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)
            return users
        } catch {
            throw NetworkError.decodingError
        }
    }
}
