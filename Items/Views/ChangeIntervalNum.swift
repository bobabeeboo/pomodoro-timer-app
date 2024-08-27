//
//  ChangeIntervalNum.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-14.
//

import SwiftUI

struct ChangeIntervalNum: View {
    @ObservedObject var viewModel: ViewModel
    
    var maxIntervalNum = 10
    
    var body: some View {
        VStack {
            HStack {
                Text("# of intervals:")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.textmain)
                Spacer()
                
                Button {
                    if viewModel.intentions.count > 1 {
                        viewModel.intervalNum -= 1
                        viewModel.intervalNum = max(viewModel.intervalNum, 1)
                        viewModel.intentions.removeLast()
                        print("intentions.count: \(viewModel.intentions.count)")
                    }
                } label: { AddMinusButton(icon: "minus", size: 16) }
                
                Text("\(viewModel.intentions.count)") // this will be the # that changes.
                    .font(.system(.body, design: .rounded))
                    .padding([.leading, .trailing], 8)
                
                Button {
                    if viewModel.intentions.count < maxIntervalNum {
                        viewModel.intervalNum += 1
                        viewModel.intentions.append("")
                        print(viewModel.intentions.count)
                    }
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
            ChangeIntervalNum(viewModel: viewModel)
                .padding(40)
        }
    }
    
    return Preview()
}
