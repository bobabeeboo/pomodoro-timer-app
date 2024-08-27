//
//  IntentionBlock.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

struct IntentionBlock: View {
    @ObservedObject var viewModel: ViewModel
    
    @Binding var showingMidSessionView: Bool
    var index: Int
    
    @State private var currentTime: Date = Date.now
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Text(currentTime + TimeInterval((index * (viewModel.intervalLength + viewModel.breakLength))), style: .time)
                .font(.system(size: 14, design: .rounded))
                .foregroundStyle(.textdim)
                .opacity(0.6)
                .padding(10)
            
            ZStack(alignment: .center) {
                if index < viewModel.intentions.count {
                    TextField("Intention \(index + 1):", text: $viewModel.intentions[index])
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.textmain)
                        .padding([.leading, .trailing], 10)
                        .multilineTextAlignment(.center)
                } else {
                    Text("Index out of range")
                }
            }
            .frame(width: 275, height: max(CGFloat(viewModel.intervalLength / 60 * 4), 35))
            .background(Color.accent.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        // dont think this is currently working? ==================================================================================
        .onReceive(timer) { time in
            if viewModel.timerIsActive == false { // only updates when timer isnt running
                // if mid session, only updates timestamps of future intervals
                if showingMidSessionView == true && index > viewModel.currentInterval {
                    currentTime = time
                    print("updated time - midSession")
                } else if showingMidSessionView == false {
                    currentTime = time
                    print("updated time - newSession")
                }
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @ObservedObject var viewModel = ViewModel()
        @State var showingMidSessionView = true

        var body: some View {
            HStack {
                Spacer()
                IntentionBlock(viewModel: viewModel, showingMidSessionView: $showingMidSessionView, index: 0)
                Spacer()
            }
        }
    }
    
    return Preview()
}
