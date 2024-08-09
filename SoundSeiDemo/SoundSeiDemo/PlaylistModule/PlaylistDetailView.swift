//
//  PlaylistDetailView.swift
//  SoundSeiDemo
//
//  Created by Ayush Jamindar on 8/6/24.
//

import SwiftUI

struct PlaylistDetailView: View {
    var playlist: Playlist
    
    var body: some View {
        List(playlist.songs) { song in
            HStack {
//                Image(song.imageName)
//                    .resizable()
//                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(song.title)
                    Text(song.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    // add action here
                }) {
                    Image("menu_button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationTitle(playlist.playlistName)
    }
}


