//
//  ChangeBreakLength.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-14.
//

import SwiftUI

struct ChangeBreakLength: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Break length:")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.textmain)
                Spacer()
                
                Button {
                    viewModel.breakLength -= 60
                    viewModel.breakLength = max(viewModel.breakLength, 60)
                } label: { AddMinusButton(icon: "minus", size: 16) }
                
                Text("\(viewModel.breakLength / 60)") // this will be the # that changes.
                    .font(.system(.body, design: .rounded))
                    .padding([.leading, .trailing], 8)
                
                Button {
                    viewModel.breakLength += 60
                    viewModel.breakLength = min(viewModel.breakLength, 3600) // max break length = 1 hr (60 * 60)
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
            ChangeBreakLength(viewModel: viewModel)
                .padding(40)
        }
    }
    
    return Preview()
}
