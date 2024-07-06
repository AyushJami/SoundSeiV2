//
//  PlaylistsScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI

struct PlaylistsScreen: View { // Define the playlists screen view of the app
    var body: some View {
        ZStack { // Use a ZStack to layer the background color and the text
            Color("CustomColor").ignoresSafeArea(.all)
            Text("Playlists Screen") // Display a text label with the string "Playlists Screen"
        }
    }
}

#Preview {
    PlaylistsScreen()
}
