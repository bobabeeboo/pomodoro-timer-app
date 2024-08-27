//
//  Main.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-17.
//

import SwiftUI

struct Main: View {
    @StateObject var viewModel = ViewModel()
    @Binding var showingMidSessionView: Bool
    
    var body: some View {
        if showingMidSessionView == false {
            NewSessionView(viewModel: viewModel, showingMidSessionView: $showingMidSessionView)
        } else {
            MidSessionView(viewModel: viewModel, showingMidSessionView: $showingMidSessionView)
        }
    }
}

#Preview {
    struct Preview: View {
        @State var showingMidSessionView = false
        
        var body: some View {
            Main(showingMidSessionView: $showingMidSessionView)
        }
    }
    return Preview()
}
