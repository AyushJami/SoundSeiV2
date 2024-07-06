//
//  PlaylistView.swift
//  SoundSeiDemo
//
//

import Foundation

// ViewModel to manage playlists
class PlaylistView: ObservableObject {
    @Published var playlists: [Playlist] = [] // Array of playlists
    
    // Method to add a new playlist
    func addPlaylist(name: String) {
        let newPlaylist = Playlist(name: name, durations: [])
        playlists.append(newPlaylist)
    }
    
    // Method to add duration to a playlist
    func addDurationToPlaylist(duration: Double, playlistIndex: Int) {
        guard playlistIndex < playlists.count else {
            return
        }
        playlists[playlistIndex].durations.append(duration)
    }
}
