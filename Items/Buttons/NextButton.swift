//
//  NextButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-18.
//

import SwiftUI

struct NextButton: View {
    var currentInterval: Int
    var intervalNum: Int
    var timeRemaining: Int
    
    var body: some View {
        Text(currentInterval == intervalNum - 1 ? "COMPLETE SESSION" : "NEXT →")
            .font(.body)
            .bold()
            .foregroundStyle(Color(.white))
            .frame(width: 280, height: timeRemaining > 0 ? 0 : 50)
            .background(Color(.primarycolor))
            .clipShape(RoundedRectangle(cornerRadius: 25))

    }
}

#Preview {
    NextButton(currentInterval: 0, intervalNum: 1, timeRemaining: 100)
}
