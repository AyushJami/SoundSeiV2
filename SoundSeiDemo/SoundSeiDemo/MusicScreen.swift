//
//  MusicScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI
import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer!
var currentPlaybackTime: TimeInterval = 0

struct Song: View {
    var title: String
    var audioFileName: String
    var imageName: String
    @State private var showTrackWindow = false // New state variable for showing the track window
    
    var body: some View {
        HStack {
                    Text(title)
                    Spacer()
                    
                        // Navigation link to show the track window
            NavigationLink(destination: TrackWindow(audioFileName: audioFileName, imageName: "albireo_blue_green")) {
                            Image("track_window_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("CustomColor"))
                    }
                }
    }
    
    
}

struct TrackWindow: View {
    @State private var isPlaying: Bool = false
    @State var showingPopup = false
    var audioFileName: String
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        HStack {
            Button(action: {
                                showingPopup = true
                            }) {
                                Image(systemName: "clock")
                            } 
                            
            Spacer()
            Button(action: {
                isPlaying.toggle()
                if isPlaying {
                    playSound()
                } else {
                    stopSound()
                }
            }) {
                Image(isPlaying ? "pause_button" : "play_button")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("CustomColor"))
            }
            Spacer()
            
        } 
       
    }
    
    func playSound() {
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
        } catch {
            print("Couldn't load the file.")
        }
    }
    
    func stopSound() {
            if let player = audioPlayer {
                currentPlaybackTime = player.currentTime
                player.pause()
            }
        }
}




struct MusicScreen: View {
    var body: some View {
        VStack {
            Text("Music").font(.title).foregroundStyle(Color("CustomColor"))
            NavigationView {
                List {
                    Section(header: Text("Calm").foregroundStyle(.white).font(.headline)) {
                        Song(title: "Calm Song 1", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "albireo_blue_green")
                                    Song(title: "Calm Song 2", audioFileName: "calm_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Calm Song 3", audioFileName: "calm_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Calm Song 4", audioFileName: "calm_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Calm Song 5", audioFileName: "calm_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Calm Song 6", audioFileName: "calm_song_1", imageName: "albireo_blue_green")
                                }
                    
                    Section(header: Text("Rhythmic").foregroundStyle(.white).font(.headline)) {
                                    Song(title: "Rhythmic Song 1", audioFileName: "rhythmic_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Rhythmic Song 2", audioFileName: "rhythmic_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Rhythmic Song 3", audioFileName: "rhythmic_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Rhythmic Song 4", audioFileName: "rhythmic_song_1", imageName: "albireo_blue_green")
                                    Song(title: "Rhythmic Song 5", audioFileName: "rhythmic_song_1", imageName: "albireo_blue_green")
                                }
                }.scrollContentBackground(.hidden)
                    .background(Color("CustomColor"))
            }
        }
    }
}



#Preview {
    MusicScreen()
}

