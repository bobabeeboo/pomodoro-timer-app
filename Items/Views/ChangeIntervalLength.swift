//
//  ChangeIntervalLength.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-14.
//

import SwiftUI

struct ChangeIntervalLength: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Interval length:")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.textmain)
                Spacer()
                
                Button {
                    viewModel.intervalLength -= 5 * 60
                    viewModel.intervalLength = max(viewModel.intervalLength, 5 * 60) // min intervalLength = 5 mins
                } label: { AddMinusButton(icon: "minus", size: 16) }
                
                Text("\(viewModel.intervalLength / 60)") // this will be the # that changes.
                    .font(.system(.body, design: .rounded))
                    .padding([.leading, .trailing], 8)
                
                Button {
                    viewModel.intervalLength += 5 * 60
                    viewModel.intervalLength = min (viewModel.intervalLength, 10800) // max intervalLength = 3 hrs
                } label: { AddMinusButton(icon: "plus", size: 16) }
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    struct Preview: View {
        @ObservedObject var viewModel = ViewModel()

        var body: some View {
            ChangeIntervalLength(viewModel: viewModel)
                .padding(40)
        }
    }
    
    return Preview()
}
