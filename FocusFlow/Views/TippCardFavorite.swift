//
//  TippCard 2.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 17.03.25.
//


import SwiftUI
import SwiftData

struct TippCardFavorite: View {
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var viewModel: TippViewModel
    @State private var isLiked = false
    var tipps: FavoriteTipp

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(tipps.text)
                .font(.headline)
                .foregroundColor(.primary)

            Text(tipps.category)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 4)

            HStack {
                Spacer()

                Button{
                    toggleLike()
                    

                }label:{
                    Image(systemName: tipps.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(tipps.isLiked ? .red : .gray)
                        .font(.system(size: 24))
                        .animation(.easeInOut(duration: 0.2), value: tipps.isLiked)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)

    }

    private func toggleLike() {
        tipps.isLiked.toggle()
    }
}
    


