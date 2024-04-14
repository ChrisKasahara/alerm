//
//  PlayingView.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/07.
//

import SwiftUI

struct PlayingView: View {
    private let sm = SoundManager()
    var body: some View {
        NavigationView {
            Button(action: {
                SoundManager.shared.stopSound()
            }, label: {
                Text("アラームを止める")
            })
            
        }.onAppear {
//            SoundManager.shared.playSound()
        }
        
    }
}

#Preview {
    PlayingView()
}
