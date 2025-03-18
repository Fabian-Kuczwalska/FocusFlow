//
//  QuestListView.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 06.03.25.
//



import SwiftUI
import SwiftData
// MARK: - TippsListView
struct TippsListView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: TippViewModel
    @Query(filter: #Predicate<FavoriteTipp> { _ in true }, sort: \FavoriteTipp.text) var tips: [FavoriteTipp]
    var body: some View {
        NavigationStack {
            VStack {
                // Button zur Favoriten-Ansicht
                NavigationLink(destination: FavoritenView()) {
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                        Text("Meine Favoriten")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                }
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.randomTipps ?? []) { tipp in
                            TippCard(tipps: tipp)
                                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                                .environmentObject(viewModel)
                        }
                    }
                    .padding()
                }
                Button {
                    viewModel.isActive.toggle()
                } label: {
                    Text("Fertig")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Tipps")
        }
    }
}


























