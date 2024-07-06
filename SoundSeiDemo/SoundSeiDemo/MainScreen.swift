//
//  MainScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        ZStack { // Use a ZStack to layer the background color and the tab view
            Color("CustomColor").ignoresSafeArea(.all)
            TabView { // Create a tab view for navigation between different screens
                MusicScreen().tabItem { // First tab: MusicScreen - list of all the music options (ability to play/pause, add to playlist, change duration, and see different vizualizers)
                    Label("Music", image: "MusicTab")
                }
                SoundsScreen().tabItem { // Second tab: SoundsScreen - list of all the sound options (same functionality as music screen)
                    Label("Sounds", image: "SoundsTab")
                }
                PlaylistsScreen().tabItem { // Third tab: PlaylistsScreen - list of playlists created from Music & Sounds that the user puts together
                    Label("Playlists", image: "PlaylistsTab")
                }
            }.accentColor(Color.white)
        }
    }
}

#Preview {
    MainScreen()
}
