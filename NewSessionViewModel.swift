//
//  NewSessionViewModel.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

struct NewSessionViewModel: View {
    var body: some View {
        

        struct roundButton: View {
            var text: String
            
            var body: some View {
                Text(text)
                    .font(.body)
                    .bold()
                    .foregroundStyle(Color(.white))
                    .frame(width: 250, height: 45)
                    .background(Color(.primarycolor))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding(20)
            }
        }
    }
}

#Preview {
    NewSessionViewModel()
}
