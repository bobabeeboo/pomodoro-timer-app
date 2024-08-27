//
//  PlaySound.swift
//  Timer App
//
//  Created by Isabella Linde on 2024-07-19.
//

import SwiftUI
import AVKit

struct PlaySound: View {
    @State private var player: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Button {
                self.player.play()
                print("play sound")
            } label: {
                Text("play sound")
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "chime1", ofType: "wav")
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

#Preview {
    PlaySound()
}
