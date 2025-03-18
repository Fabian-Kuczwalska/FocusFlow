//
//  QuoteViewModel.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 25.02.25.
//

import SwiftUI
import Observation

@Observable
class QuoteViewModel {
    var quote: Quote?
    var isLoading = false
    var errorMessage: String?
    var qouteRepoitory: QuoteRepoitory = QuoteRepoitory()
    
    func loadQuote() {
        isLoading = true
        Task {
            do {
                self.quote = try await qouteRepoitory.getRandomQuote()
                errorMessage = nil
            } catch {
                errorMessage = "Fehler beim Laden: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
    func loadDailyQuote() {
        isLoading = true
        Task {
            do {
                self.quote = try await qouteRepoitory.getDailyQuote()
                errorMessage = nil
            } catch {
                errorMessage = "Fehler beim Laden: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
}
