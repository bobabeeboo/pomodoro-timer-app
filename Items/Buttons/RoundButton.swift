//
//  RoundButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

struct RoundButton: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundStyle(Color(.white))
            .frame(width: 280, height: 50)
            .background(Color(.primarycolor))
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}


#Preview {
    RoundButton(text: "test button")
}
