//
//  FavoriteTipp.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 12.03.25.
//

import Foundation
import SwiftData

@Model
class FavoriteTipp: ObservableObject {
    var id = UUID()
    var text: String
    var category: String
    var isLiked: Bool
    
    
    init(text: String, category: String, isLiked: Bool) {
        self.id = UUID()
        self.text = text
        self.category = category
        self.isLiked = isLiked
    }
}
