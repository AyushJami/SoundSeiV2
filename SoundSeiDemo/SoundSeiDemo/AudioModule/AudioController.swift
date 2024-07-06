//
//  AudioController.swift
//  SoundSeiDemo
//
//

import Foundation
import AVFoundation
import Combine // framework for processing values over time

class AudioController: ObservableObject { // Define an observable class for controlling audio playback
    @Published var isPlaying = false // any change to this property will trigger a notification to all UI
    private var audioPlayer: AVAudioPlayer? // managing audio player & playback times
    private var currentPlaybackTime: TimeInterval = 0 // tracks the current playback time
    private var selectedPlaybackTime: TimeInterval = 0 // stores the selected playback time
    
    var duration: Double { // Computed property to get the duration of the track
            return audioPlayer?.duration ?? 0.0 // duraction of the track
        }
    
    var currentTime: Double { // Computed property to get and set the current playback time
            get {
                return audioPlayer?.currentTime ?? 0.0
            }
            set {
                audioPlayer?.currentTime = newValue
            }
        }
    
    func playSound(audioFileName: String, playbackTime: Double) { // Function to play a sound from a specified audio file and playback time
        // Get the path of the audio file
        let path = Bundle.main.path(forResource: audioFileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do { // Check if the same song is being played
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
            // Update playback state and selected playback time
            isPlaying = true
            selectedPlaybackTime = playbackTime
            // Schedule a stop event after the selected playback time
            DispatchQueue.main.asyncAfter(deadline: .now() + selectedPlaybackTime) {
                self.stopSound()
            }
        } catch {
            // Handle error if the file cannot be loaded
            print("Couldn't load the file.")
        }
    }
    
    func stopSound() { // Function to stop the sound playback
        if let player = audioPlayer {
            // Store the current playback time and pause the player
            currentPlaybackTime = player.currentTime
            player.pause()
        }
        // Update playback state
        isPlaying = false
    }
    
    func seek(to time: Double) { // Function to seek to a specific time in the track
            audioPlayer?.currentTime = time
    }
}
