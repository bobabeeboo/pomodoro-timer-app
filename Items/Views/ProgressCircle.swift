//
//  ProgressCircle.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-23.
//

import SwiftUI

struct ProgressCircle: View {
    var isFilled: Bool
    
    var body: some View {
        Circle()
            .frame(width: 16)
            .foregroundColor(isFilled ? .primarycolor : .secondarycolor.opacity(0.8))
            .overlay(Circle().stroke(.primarycolor, lineWidth: 1))
    }
}

#Preview {
    ProgressCircle(isFilled: false)
}
