//
//  ChangeView.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

struct ChangeSessionDetails: View {
    @Binding var changingValue: Int
    var text: String
    var isIntervalLength: Bool
    var isBreakLength: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .font(.body)
                    .foregroundStyle(.textmain)
                Spacer()
                
                Button {
                    changingValue -= isIntervalLength ? 5 * 60 : isBreakLength ? 60 : 1
                    changingValue = max(changingValue, isIntervalLength ? 5 * 60 : 1)
                } label: { AddMinusButton(icon: "minus", size: 10) }
                
                Text("\(isIntervalLength || isBreakLength ? changingValue / 60 : changingValue)") // this will be the # that changes.
                    .padding([.leading, .trailing], 8)
                
                Button {
                    changingValue += isIntervalLength ? 5 * 60 : isBreakLength ? 60 : 1
                } label: { AddMinusButton(icon: "plus", size: 10) }
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    struct Preview: View {
        @State var changingValue = 5
        var body: some View {
            ChangeSessionDetails(changingValue: $changingValue, text: "heheheh", isIntervalLength: false, isBreakLength: true)
                .padding(40)
        }
    }
    
    return Preview()
}
