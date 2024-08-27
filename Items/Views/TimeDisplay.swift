//
//  TimeDisplay.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-12.
//

import SwiftUI

struct TimeDisplay: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        HStack {
            Text(timeString(time: viewModel.timeRemaining))
                .font(.system(size: 60, design: .rounded))
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Spacer()
                
                HStack() {
                    Button { // - BUTTON/
                        viewModel.timeRemaining = max(viewModel.timeRemaining - 5 * 60, 0)
                    } label: { AddMinusButton(icon: "minus", size: 20) }
                    
                    Button { // + BUTTON
                        viewModel.timeRemaining += 5 * 60
                    } label: { AddMinusButton(icon: "plus", size: 20) }
                }
            }
        }
        .frame(width: 275, height: 60)
    }
}

#Preview {
    struct Preview: View {
        @ObservedObject var viewModel = ViewModel()
        
        var body: some View {
            TimeDisplay(viewModel: viewModel)
        }
    }
    return Preview()
}
