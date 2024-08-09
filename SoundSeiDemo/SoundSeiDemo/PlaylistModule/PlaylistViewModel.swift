//
//  PlaylistViewModel.swift
//  SoundSeiDemo
//
//  Created by Ayush Jamindar on 8/6/24.
//

import SwiftUI
import Foundation


class PlaylistViewModel: ObservableObject {
    @Published var playlists: [Playlist] = [
        Playlist(playlistName: "Favorites", songs: [
            AudioItemModel(title: "Song 1", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "song1.jpg", category: "Calm"),
            AudioItemModel(title: "Song 2", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "song2.jpg", category: "Calm")
        ], songDurations: [180.0, 210.0]),
        
        Playlist(playlistName: "Favorites2", songs: [
            AudioItemModel(title: "Song 3", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "song1.jpg", category: "Calm"),
            AudioItemModel(title: "Song 4", audioFileName: "Music/contemplation_time_thought_full725.m4a", imageName: "song2.jpg", category: "Calm")
        ], songDurations: [180.0, 210.0])
    ]
}
