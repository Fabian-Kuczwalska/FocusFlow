//
//  TippService.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 07.03.25.
//

import Foundation


class TippService {
    private let baseURL = "http://127.0.0.1:8080" // Vapor-Server Adresse
    /// Ruft alle Tipps ab
    func fetchAllTipps() async throws -> [Tipp] {
        guard let url = URL(string: "\(baseURL)/tipps") else {
            throw URLError(.badURL)
        }
        let (data,_) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Tipp].self, from: data)
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            return []
        }
    }
    /// Ruft Tipps einer bestimmten Kategorie ab
    func fetchTippsByCategory(_ category: String) async throws -> [Tipp] {
        let categoryEncoded = category.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? category
        guard let url = URL(string: "\(baseURL)/tipps/\(categoryEncoded)") else {
            throw URLError(.badURL)
        }
        return try await fetchData(from: url)
    }
    /// Ruft einen bestimmten Tipp per ID ab
    func fetchTippByID(_ id: UUID) async throws -> Tipp {
        guard let url = URL(string: "\(baseURL)/tipp/\(id.uuidString)") else {
            throw URLError(.badURL)
        }
        return try await fetchData(from: url)
    }
    /// Allgemeine Fetch-Funktion für JSON-Daten
    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}









