//
//  PlaySound.swift
//  alarm
//
//  Created by Chris Kasahara on 2024/04/07.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var audioPlayer: AVAudioPlayer?
    var playing = false
    
    func playSound() {
        self.stopSound()
        guard let url = Bundle.main.url(forResource: "test-sound", withExtension:"mp3") else {
            print("値が nil")
            return
        }
        playing = true
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    audioPlayer?.numberOfLoops = -1
                    
                    if playing {
                        audioPlayer?.play()
                        
                    }
                } catch let error {
                    print("faild play: \(error.localizedDescription)")
                }
    }
    
    func stopSound() {
        audioPlayer?.stop()
        playing = false
    }
}


