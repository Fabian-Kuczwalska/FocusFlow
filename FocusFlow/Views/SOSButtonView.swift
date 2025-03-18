//
//  SosScreen.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 21.02.25.
//

//import SwiftUI
//
//struct SOSButtonView: View {
//    var body: some View {
//        VStack {
//            Text("Drück Mich wenn du dich überfordert fühlst!")
//                .multilineTextAlignment(.center)
//                .font(.title2)
//                .bold()
//
//            Button(action: {
//                // Hier kommt die SOS-Logik rein
//            }) {
//                Text("SOS")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundStyle(.white)
//                    .frame(width: 200, height: 200)
//                    .background {
//                        Circle()
//                            .fill(.red)
//                            .shadow(radius: 10)
//                    }
//            }
//            .buttonStyle(.plain) // Entfernt Standard-Button-Stile
//            .padding()
//        }
//    }
//}
//#Preview {
//    SOSButtonView()
//}


//import SwiftUI
//
//struct SOSButtonView: View {
//    @State private var waveOffset: CGFloat = 0
//
//    var body: some View {
//        VStack {
//            Text("Drück Mich wenn du dich überfordert fühlst!")
//                .multilineTextAlignment(.center)
//                .font(.title2)
//                .bold()
//            ZStack {
//                // Äußere Wellen
//                ForEach(0..<2, id: \.self) { i in
//                    Circle()
//                        .stroke(Color.red.opacity(0.5), lineWidth: 4)
//                        .frame(width: 250 + CGFloat(i * 20) + waveOffset, height: 250 + CGFloat(i * 20) + waveOffset)
//                        .animation(
//                            .easeInOut(duration: 0.8).repeatForever(autoreverses: true),
//                            value: waveOffset
//                        )
//                }
//
//                // SOS Button
//                Button(action: {
//                    // Hier kommt die SOS-Logik rein
//                }) {
//                    Text("SOS")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundStyle(.white)
//                        .frame(width: 200, height: 200)
//                        .background {
//                            Circle()
//                                .fill(.red)
//                                .shadow(radius: 10)
//                        }
//                }
//                .buttonStyle(.plain)
//            }
//            .onAppear {
//                waveOffset = 10
//            }
//        }
//    }
//}
//
//#Preview {
//    SOSButtonView()
//}




// SOSButtonApp - SwiftUI mit MVVM für iOS 18
import SwiftUI

//// MARK: - SOSButtonView mit Animation
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




