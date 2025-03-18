//
//  QuestModel.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 06.03.25.
//

import Foundation



// MARK: - Model für Quest
struct Quest: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var isFavorite: Bool
}
