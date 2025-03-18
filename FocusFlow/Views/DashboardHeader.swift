//
//  DashboardHeader.swift
//  FocusFlow
//
//  Created by Fabian Kuczwalska on 25.02.25.
//

import SwiftUI

struct DashboardHeader: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundStyle(Color.green).opacity(0.5)
                    .frame(width: .infinity, height: 300)
                
                Text("Hey Arnold,\n schön dass du da bist")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .bold()
            }
            RandomQuotesView()
//            Divider()
        }
        .ignoresSafeArea()
        Spacer()
    }
}

#Preview {
    DashboardHeader()
}
