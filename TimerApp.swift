//
//  Timer_AppApp.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-06-16.
//

import SwiftUI

@main
struct TimerApp: App {
    @State var showingMidSessionView = false
    
    var body: some Scene {
        WindowGroup {
            Main(showingMidSessionView: $showingMidSessionView)
        }
    }
}
