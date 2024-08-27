//
//  MinusButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-19.
//

import SwiftUI

struct MinusButton: View {
    var body: some View {
        Text("-")
            .font(.title)
            .foregroundStyle(.textdim)
            .frame(width: 24, height: 24)
            .background(.backgroundshade)
            .opacity(0.5)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MinusButton()
}
