//
//  MusicScreen.swift
//  SoundSeiDemo
//
//

import SwiftUI
import UIKit
import AVFoundation

struct MusicScreen: View { // Define the music screen view of the app
    let musicItems = [ // Define a list of audio items
        // Create an audio item model for each song with its title, audio file name, image name, and category
        AudioItemModel(title: "Calm Song 1", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "albireo_blue_green", category: "Calm"),
        AudioItemModel(title: "Calm Song 2", audioFileName: "calm_song_1.m4a", imageName: "albireo_blue_green", category: "Calm"),
        // Add other songs here
    ]

    var body: some View {
        // Use the AudioListView to display the list of music items on the Music screen
        AudioListView(items: musicItems, title: "Music")
    }
}

#Preview {
    MusicScreen()
}

