//
//  RandomQuotesView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 25.02.25.
//

import SwiftUI

struct RandomQuotesView: View {
    @State private var viewModel = QuoteViewModel()
    var body: some View {
        ZStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Lade Zitat...")
                } else if let quote = viewModel.quote {
                    Text("\"\(quote.q)\"")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.white)
                    
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                
                Button("Neues Zitat") {
                    viewModel.loadQuote()
                    
                }
                .foregroundStyle(Color.white)
                .underline()
                .padding()
            }
            .padding()
            .background{
                Rectangle()
                    .foregroundStyle(Color.blue)
                    .cornerRadius(24)
            }
            
            .onAppear {
                viewModel.loadDailyQuote()
            }
        }
    }
}

#Preview {
    RandomQuotesView()
}
