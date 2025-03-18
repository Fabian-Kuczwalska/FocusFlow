//
//  StartView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 18.03.25.
//


import SwiftUI
struct StartView: View {
    @AppStorage("userName") private var userName: String = ""
    @State private var inputName: String = ""
    var body: some View {
        if userName.isEmpty {
            VStack {
                Text("Willkommen! ")
                    .font(.largeTitle)
                Text("Wie ist dein Name?")
                    .font(.title)
                    .padding()
                TextField("Dein Name", text: $inputName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                Button("Speichern") {
                    userName = inputName
                }
                .frame(width: 100, height: 50 )
                .background(.green.opacity(0.4))
                .cornerRadius(24)
                .foregroundStyle(.black)
                .disabled(inputName.isEmpty)
                .padding()
            }
            .background{
                Background()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            }
        } else {
            MainTabView()
        }
    }
}


