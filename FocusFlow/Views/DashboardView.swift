//
//  Dashboard.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 21.02.25.
//



//- Begrüßungstext & täglicher Motivationstipp.
//
//- Schnellzugriff auf „Planung“ und „Notfallhilfe“.
//
//- API-Anfrage für motivierende Sprüche einbauen.





import Foundation
import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundStyle(Color.green).opacity(0.5)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Text("Hey Arnold, Schön das du da bist")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
            }
            RandomQuotesView()
            Divider()
        }
        .ignoresSafeArea()
        Spacer()
    }
}

#Preview {
    DashboardView()
}
