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

struct Song: View {
    var title: String
    var audioFileName: String
    var body: some View {
        Button(action: {
            playSound()
        }) {
            Text(title).foregroundStyle(Color("CustomColor"))
        }
    }
    
    func playSound() {
        let path = Bundle.main.path(forResource: audioFileName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("couldn't load the file")
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
                                    Song(title: "Calm Song 1", audioFileName: "Music/contemplation_time_thought_full725.m4a")
                                    Song(title: "Calm Song 2", audioFileName: "calm_song_1")
                                    Song(title: "Calm Song 3", audioFileName: "calm_song_1")
                                    Song(title: "Calm Song 4", audioFileName: "calm_song_1")
                                    Song(title: "Calm Song 5", audioFileName: "calm_song_1")
                                    Song(title: "Calm Song 6", audioFileName: "calm_song_1")
                                }
                    
                    Section(header: Text("Rhythmic").foregroundStyle(.white).font(.headline)) {
                                    Song(title: "Rhythmic Song 1", audioFileName: "rhythmic_song_1")
                                    Song(title: "Rhythmic Song 2", audioFileName: "rhythmic_song_1")
                                    Song(title: "Rhythmic Song 3", audioFileName: "rhythmic_song_1")
                                    Song(title: "Rhythmic Song 4", audioFileName: "rhythmic_song_1")
                                    Song(title: "Rhythmic Song 5", audioFileName: "rhythmic_song_1")
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
