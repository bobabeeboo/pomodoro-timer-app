//
//  AddMinusButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-19.
//

import SwiftUI

struct AddMinusButton: View {
    var icon: String
    var size: CGFloat
    
    var body: some View {
        Image(systemName: icon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .foregroundStyle(.textdim)
            .opacity(0.5)
            .padding(3)
    }
}

#Preview {
    AddMinusButton(icon: "minus", size: 20)
}
