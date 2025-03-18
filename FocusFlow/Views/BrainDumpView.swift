//
//  BrainDumpView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 06.03.25.
//

import SwiftUI

// MARK: - BrainDumpView
struct BrainDumpView: View {
    @ObservedObject var viewModel: BrainDumpViewModel
    @Binding var isActive: Bool
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            TextField("Neuer BrainDump", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Speichern") {
                viewModel.addBraindump(inputText)
                inputText = ""
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            

            if viewModel.allQuestsCompleted() {
                Button("Zurück") {
                    withAnimation {
                        isActive.toggle()
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    BrainDumpView(viewModel: BrainDumpViewModel(), isActive: .constant(true))
}

