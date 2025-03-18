//
//  SosHeader.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 04.03.25.
//

import SwiftUI

struct SosView: View {
    
    @State private var viewModel = QuoteViewModel()
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(Color.green).opacity(0.5)
                .frame(width: 380, height: 200)
                .cornerRadius(24)
            
            VStack{
                if viewModel.isLoading {
                    ProgressView("Lade Zitat...")
                } else if let quote = viewModel.quote {
                    Text("\"\(quote.q)\"")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    Text("- \(quote.a)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                Button("Neues Zitat") {
                    viewModel.loadQuote()
                }
                .padding()
            }
            .onAppear {
                viewModel.loadQuote()
            }
        }
        Spacer()
        
    }
}


#Preview {
    SosView()
}
