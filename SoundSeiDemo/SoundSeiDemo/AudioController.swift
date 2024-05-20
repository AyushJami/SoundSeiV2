//
//  AudioController.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 5/19/24.
//

import Foundation
import AVFoundation
import Combine // framework for processing values over time

class AudioController: ObservableObject {
    @Published var isPlaying = false // any change to this property will trigger a notification to all UI
    private var audioPlayer: AVAudioPlayer?
    private var currentPlaybackTime: TimeInterval = 0
    
    func playSound(audioFileName: String) {
        let path = Bundle.main.path(forResource: audioFileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            if let player = audioPlayer, let playerUrl = player.url, playerUrl == url {
                // If the same song is being played, resume playback from the stored time
                audioPlayer?.currentTime = currentPlaybackTime
                audioPlayer?.play()
            } else {
                // If a different song is being played or no song is playing, start playback from the beginning
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            isPlaying = true
        } catch {
            print("Couldn't load the file.")
        }
    }
    
    func stopSound() {
        if let player = audioPlayer {
            currentPlaybackTime = player.currentTime
            player.pause()
        }
        isPlaying = false
    }
}
