//
//  ProgressBar.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            // bg bar
            Rectangle()
                .frame(width: 275, height: 4)
                .foregroundStyle(.backgroundshade)
            
            // tracking bar
            Rectangle()
                .frame(width: (CGFloat(progress) * 275), height: 4)
                .foregroundStyle(.primarycolor)
        }
    }
}

#Preview {
    ProgressBar(progress: 0.5)
}
