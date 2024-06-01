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
    private var currentPlaybackTime: TimeInterval = 0 // tracks the current playback time
    private var selectedPlaybackTime: TimeInterval = 0 // stores the selected playback time
    
    var duration: Double {
            return audioPlayer?.duration ?? 0.0 // duraction of the track
        }
    
    var currentTime: Double {
            get {
                return audioPlayer?.currentTime ?? 0.0
            }
            set {
                audioPlayer?.currentTime = newValue
            }
        }
    
    func playSound(audioFileName: String, playbackTime: Double) {
        let path = Bundle.main.path(forResource: audioFileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            if let player = audioPlayer, let playerUrl = player.url, playerUrl == url {
                // If the same song is being played, resume playback from the stored time
                audioPlayer?.prepareToPlay()
                audioPlayer?.currentTime = currentPlaybackTime
                audioPlayer?.play()
            } else {
                // If a different song is being played or no song is playing, start playback from the beginning
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            isPlaying = true
            selectedPlaybackTime = playbackTime
            DispatchQueue.main.asyncAfter(deadline: .now() + selectedPlaybackTime) {
                self.stopSound()
            }
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
    
    func seek(to time: Double) {
            audioPlayer?.currentTime = time
    }
}
