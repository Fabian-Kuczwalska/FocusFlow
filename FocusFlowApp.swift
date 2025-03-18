//
//  FocusFlowApp.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 18.02.25.
//

import SwiftUI
import SwiftData

@main
struct FocusFlowApp: App {
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .modelContainer(for: [
                    FavoriteTipp.self
                ])
        }
    }
}
