//
//  ContentView.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

struct NewSessionView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var showingMidSessionView: Bool
    
    var body: some View {
        ZStack {
            VStack {
                // change settings block
                ZStack {
                    VStack {
                        ChangeIntervalNum(viewModel: viewModel)
                        ChangeIntervalLength(viewModel: viewModel)
                        ChangeBreakLength(viewModel: viewModel)
                    }
                }
                .padding(20)
                .background(.secondarycolor)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .backgroundshade.opacity(0.7), radius: 10, x:0, y: 10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.accent), lineWidth: 2))
                
                Spacer(minLength: 35)
                
                // intention blocks
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<viewModel.intentions.count, id: \.self) { index in
                            IntentionBlock(viewModel: viewModel,
                                           showingMidSessionView: $showingMidSessionView,
                                           index: index)
                            if index < viewModel.intentions.count - 1 {
                                HStack {
                                    Divider()
                                        .frame(height: CGFloat(viewModel.breakLength / 60 * 3))
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    showingMidSessionView = true
                    print("starting session")
                } label: {
                    RoundButton(text: "START")
                        .padding(20)
                }
            }
            .frame(width: 280)
            .padding(.top, 30)
        }
    }
}

#Preview {
    struct Preview: View {
        @StateObject var viewModel = ViewModel()
        @State var showingMidSessionView = false

        var body: some View {
            NewSessionView(viewModel: viewModel, showingMidSessionView: $showingMidSessionView)
        }
    }
    
    return Preview()
}
