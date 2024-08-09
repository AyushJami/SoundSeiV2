//
//  PlaylistModel.swift
//  SoundSeiDemo
//
//

import Foundation

// Define a Playlist struct to represent a playlist
struct Playlist: Identifiable {
    
    var id: UUID = UUID()
    var playlistName: String
    var songs:[AudioItemModel]
    var songDurations: [Double] // Array to store durations of songs
}
