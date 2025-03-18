//
//  SosScreen.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 21.02.25.
//


import SwiftUI

struct SOSButtonView: View {
    @StateObject private var viewModel = TippViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isActive {
                    TippsListView(viewModel: viewModel)
                } else {
                    ButtonLogik(viewModel: viewModel)
                }
            }
            .navigationTitle("SOS")
        }
    }
}


#Preview {
    SOSButtonView()
}




