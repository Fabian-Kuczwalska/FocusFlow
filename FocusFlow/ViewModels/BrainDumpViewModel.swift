//
//  BrainDumpViewModel.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 06.03.25.
//

import Foundation



// MARK: - ViewModel für Braindumps & Quests
class BrainDumpViewModel: ObservableObject {
    @Published var braindumps: [String] = []
    @Published var quests: [Quest] = [
        Quest(title: "Erste Quest", isCompleted: false, isFavorite: false),
        Quest(title: "Zweite Quest", isCompleted: false, isFavorite: false),
        Quest(title: "Dritte Quest", isCompleted: false, isFavorite: false)
    ]
    
    func addBraindump(_ text: String) {
        braindumps.append(text)
    }
    

    
    func toggleFavorite(_ quest: Quest) {
        if let index = quests.firstIndex(where: { $0.id == quest.id }) {
            quests[index].isFavorite.toggle()
        }
    }
    
    func allQuestsCompleted() -> Bool {
        return quests.allSatisfy { $0.isCompleted }
    }
}
