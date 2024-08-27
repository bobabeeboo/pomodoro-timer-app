//
//  MidSessionView.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI
import Combine
import AVKit

struct MidSessionView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var showingMidSessionView: Bool
    
    @State private var player: AVAudioPlayer!
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 30) {
            let intervalProgress = Double(viewModel.timeRemaining) / Double(viewModel.intervalLength)
            let breakProgress = Double(viewModel.timeRemaining) / Double(viewModel.breakLength)

            // info display block
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    // big time display
                    TimeDisplay(viewModel: viewModel)
                    
                    // Progress bar
                    ProgressBar(progress: min(viewModel.onBreak ? breakProgress : intervalProgress, 1))
                    
                    // intention
                    Text(viewModel.intentions[viewModel.currentInterval].isEmpty ? "No intention set." : viewModel.intentions[viewModel.currentInterval])
                        .font(.system(viewModel.intentions[viewModel.currentInterval].isEmpty ? .body : .title3, design: .rounded))
                        .foregroundStyle(.textdim)
                        .italic(viewModel.intentions[viewModel.currentInterval].isEmpty ? true : false)
                        .opacity(viewModel.intentions[viewModel.currentInterval].isEmpty ? 0.5 : 1)
                    
                    HStack {
                        // progress circles
                        HStack {
                            ForEach(0..<viewModel.currentInterval + 1, id: \.self) { index in
                                ProgressCircle(isFilled: true)
                            }
                            ForEach(0..<(viewModel.intervalNum - viewModel.currentInterval - 1), id: \.self) { index in
                                ProgressCircle(isFilled: false)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            Button {
                                if viewModel.timerIsActive {
                                    viewModel.timerIsActive = false
                                } else {
                                    viewModel.timerIsActive = true
                                }
                            } label: {
                                PauseButton(timerIsActive: viewModel.timerIsActive)
                            }
                            
                            // cancel session
                            Button {
                                showingMidSessionView = false
                            } label: {
                                XButton()
                            }
                        }
                    }
                    .frame(width: 275)
                }
            }
            .padding(20)
            .background(.secondarycolor.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .backgroundshade.opacity(0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:0, y: 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.accent), lineWidth: 2))
            .onReceive(timer) { _ in
                guard viewModel.timerIsActive else { return }
                if viewModel.timeRemaining > 0 {
                    viewModel.timeRemaining -= 1
                } else {
                    viewModel.timerIsActive = false
                    self.player.play()
                }
            }
            .onAppear {
                let sound = Bundle.main.path(forResource: "chime1", ofType: "wav")
                self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            }
            
            // intention blocks
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<viewModel.intentions.count, id: \.self) { index in
                        HStack {
                            Spacer()
                            IntentionBlock(viewModel: viewModel,
                                           showingMidSessionView: $showingMidSessionView,
                                           index: index)
                            Spacer()
                        }
                        .overlay {
                            GeometryReader { geo in
                                let intervalProgressHeight = intervalProgress * geo.size.height
                                
                                VStack() {
                                    Color.clear
                                        .frame(width: 50,
                                               height: max(geo.size.height - intervalProgressHeight, 0))
                                    
                                    TimeNeedle()
                                        .opacity((viewModel.currentInterval == index && viewModel.onBreak == false) ? 100 : 0)
                                }
                                .offset(y: -14)
                            }
                        }
                        
                        if index < viewModel.intentions.count - 1 {
                            HStack {
                                Spacer()
                                Divider()
                                    .frame(height: CGFloat(viewModel.breakLength / 60 * 4))
                                Spacer()
                            }
                            .overlay(alignment: .top) {
                                GeometryReader { geo in
                                    let breakProgressHeight = breakProgress * geo.size.height
                                    
                                    VStack(alignment: .center) {
                                        Color.clear
                                            .frame(width: 50,
                                                   height: max(geo.size.height - breakProgressHeight, 0))
                                        
                                        TimeNeedle()
                                            .opacity((viewModel.currentInterval == index && viewModel.onBreak == true) ? 100 : 0)
                                    }
                                    .offset(y: -14)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 5)
                .padding([.leading, .trailing])
            }
            
            Button {
                if viewModel.currentInterval == viewModel.intervalNum - 1 { // if final interval has been completed
                    showingMidSessionView = false
                } else {
                    viewModel.updateInterval()
                }
            } label: {
                NextButton(currentInterval: viewModel.currentInterval,
                           intervalNum: viewModel.intervalNum,
                           timeRemaining: viewModel.timeRemaining)
            }
        }
        .padding(20)
    }
}

func timeString(time: Int) -> String {
    let minutes = time / 60
    let seconds = time % 60
    return String(format: "%02d:%02d", minutes, seconds)
}

// CONDITIONAL VIEW MODIFIER
// didn't end up using it, but leaving here for future reference
extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
}

#Preview {
    struct Preview: View {
        @StateObject var viewModel = ViewModel()
        @State var showingMidSessionView = true
        
        var body: some View {
            MidSessionView(viewModel: viewModel, showingMidSessionView: $showingMidSessionView)
        }
    }
    
    return Preview()
}
