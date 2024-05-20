//
//  MusicScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI
import UIKit
import AVFoundation

struct MusicScreen: View {
    let musicItems = [
        AudioItemModel(title: "Calm Song 1", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "albireo_blue_green", category: "Calm"),
        AudioItemModel(title: "Calm Song 2", audioFileName: "calm_song_1.m4a", imageName: "albireo_blue_green", category: "Calm"),
        // Add other songs here
    ]

    var body: some View {
        AudioListView(items: musicItems, title: "Music")
    }
}

#Preview {
    MusicScreen()
}

