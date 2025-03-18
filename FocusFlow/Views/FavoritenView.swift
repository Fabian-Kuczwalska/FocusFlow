//
//  FavoritenView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 17.03.25.
//


import SwiftUI
import SwiftData

struct FavoritenView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Query(filter: #Predicate<FavoriteTipp> { $0.isLiked }) var favoriteTips: [FavoriteTipp]
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text("Meine Favoriten")
                    .font(.title2)
                    .bold()
                Spacer()
                Image(systemName: "chevron.left")
                    .opacity(0) // Unsichtbar für symmetrisches Layout
            }
            .padding()
            
            if favoriteTips.isEmpty {
                Text("Noch keine Favoriten")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(favoriteTips) { tipp in
                            TippCardFavorite(tipps: tipp)
                                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}
