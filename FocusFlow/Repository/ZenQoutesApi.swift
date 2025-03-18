//
//  ZenQoutesApi.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 25.02.25.
//

import Foundation

class QuoteRepoitory{
    
    func getRandomQuote() async throws-> Quote {
        
        let url = URL(string: "https://zenquotes.io/api/random")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            guard let firstQuote = quotes.first else {
                throw URLError(.badServerResponse)
            }
            return firstQuote
        } catch {
            throw error
        }
    }
    
    
    func getDailyQuote() async throws -> Quote {
        let url = URL(string: "https://zenquotes.io/api/today")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let quotes = try JSONDecoder().decode([Quote].self, from: data)
            guard let firstQuote = quotes.first else {
                throw URLError(.badServerResponse)
            }
            return firstQuote
        } catch {
            throw error
        }
    }
}





