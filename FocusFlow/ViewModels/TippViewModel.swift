//
//  TippViewModel.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 07.03.25.
//
import SwiftData
import SwiftUI
import Foundation

@MainActor
class TippViewModel: ObservableObject {
    @Published var tipps: [Tipp] = []
    @Published var errorMessage: String?
    private let service = TippService()
    @Published private var isLiked = false
    @Published var isActive: Bool = false
    init(){
        Task{
            await loadAllTipps()
        }
    }
    /// Lädt alle Tipps von der API
    func loadAllTipps() async {
        do {
            let fetchedTipps = try await service.fetchAllTipps()
            self.tipps = fetchedTipps
        } catch {
            self.errorMessage = "Fehler beim Abrufen der Tipps: \(error.localizedDescription)"
            print(errorMessage ?? "Unbekannter Fehler")
        }
    }
    /// Lädt Tipps einer bestimmten Kategorie
    func loadTippsByCategory(_ category: String) async {
        do {
            let fetchedTipps = try await service.fetchTippsByCategory(category)
            self.tipps = fetchedTipps
        } catch {
            self.errorMessage = "Fehler beim Abrufen der Kategorie \(category): \(error.localizedDescription)"
            print(errorMessage ?? "Unbekannter Fehler")
        }
    }
    /// Lädt einen spezifischen Tipp per ID
    func loadTippByID(_ id: UUID) async -> Tipp? {
        do {
            return try await service.fetchTippByID(id)
        } catch {
            self.errorMessage = "Fehler beim Abrufen des Tipps: \(error.localizedDescription)"
            print(errorMessage ?? "Unbekannter Fehler")
            return nil
        }
    }
     func fetchLikeStatus() {
//        self.isLiked = isLiked
    }

     func saveLikeStatus() {
        self.isLiked = isLiked
        //try? modelContext.save()
    }
    var categories: Set<String> { Set(tipps.map { $0.category })}
    var randomTipps: [Tipp] { categories.compactMap { category in
       tipps.filter { $0.category == category }.randomElement()
    }}
}

