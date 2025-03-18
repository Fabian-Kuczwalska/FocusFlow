//
//  ButtonLogik.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 06.03.25.
//

import SwiftUI

struct ButtonLogik: View {
    @State private var animationAmount = 1.0
    @ObservedObject var viewModel: TippViewModel

    var body: some View {
        VStack {
            
            
            Button("SOS") {
                viewModel.isActive.toggle()
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
    }
}
