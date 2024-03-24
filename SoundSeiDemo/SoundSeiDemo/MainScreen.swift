//
//  MainScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        ZStack {
            Color("CustomColor").ignoresSafeArea(.all)
            TabView {
                MusicScreen().tabItem {
                    Label("Music", image: "MusicTab")
                }
                SoundsScreen().tabItem {
                    Label("Sounds", image: "SoundsTab")
                }
                PlaylistsScreen().tabItem {
                    Label("Playlists", image: "PlaylistsTab")
                }
            }.accentColor(Color.white)
        }
    }
}

#Preview {
    MainScreen()
}
