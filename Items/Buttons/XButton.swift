//
//  XButton.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-18.
//

import SwiftUI

struct XButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .resizable()
            .frame(width: 18, height: 18)
            .foregroundStyle(Color(.textdim))
            .opacity(0.3)
    }
}

#Preview {
    XButton()
}
