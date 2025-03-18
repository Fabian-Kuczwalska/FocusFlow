//
//  TabBarView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 04.03.25.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var viewModel = BrainDumpViewModel()
    
    var body: some View {
        TabView {
            Tab {
                DashboardView()
            } label: {
                Label("Dashboard", systemImage: "house.fill")
            }
            
            Tab {
                SOSButtonView()
            } label: {
                
                Label("SOS", systemImage: "exclamationmark.triangle.fill")
            }
            
            Tab {
                TaskManager()
            } label: {
                Label("Tasks", systemImage: "checklist")
            }
        }
    }
}

#Preview {
    MainTabView()
}
