//
//  TimeNeedle.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-23.
//

import SwiftUI

struct TimeNeedle: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 315, height: 2)
                .foregroundStyle(.primarycolor)
            Circle()
                .frame(width: 10)
                .foregroundStyle(.primarycolor)
                .fixedSize()
        }
        .fixedSize()
    }
}

#Preview {
    TimeNeedle()
}
