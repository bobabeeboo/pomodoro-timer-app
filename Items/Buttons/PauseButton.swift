//
//  PauseButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-18.
//

import SwiftUI

struct PauseButton: View {
    var timerIsActive: Bool
    
    var body: some View {
        Image(systemName: timerIsActive ? "pause" : "play.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 18)
            .foregroundStyle(Color(.textdim))
            .opacity(0.3)
            .padding(.trailing, 10)
    }
}

#Preview {
    PauseButton(timerIsActive: true)
}
