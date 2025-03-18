//
//  TippCard.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 12.03.25.
//

import SwiftUI
import SwiftData

struct TippCard: View {
    
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var viewModel: TippViewModel
    @State private var isLiked = false
    var tipps: Tipp

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
                    let tipp = FavoriteTipp(text: tipps.text, category: tipps.category, isLiked: true)
                    modelContext.insert(tipp)
                }label:{
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                        .font(.system(size: 24))
                        .animation(.easeInOut(duration: 0.2), value: isLiked)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
    private func toggleLike() {
        isLiked.toggle()
    }
}
    

#Preview {
    TippCard(tipps: Tipp(id: UUID(), text: "", category: ""))
}
