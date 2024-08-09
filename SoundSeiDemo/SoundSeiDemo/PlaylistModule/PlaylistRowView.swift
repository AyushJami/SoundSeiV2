//
//  PlaylistRowView.swift
//  SoundSeiDemo
//
//  Created by Ayush Jamindar on 8/6/24.
//

import SwiftUI

struct PlaylistRowView: View {
    var playlist: Playlist
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(playlist.playlistName)
                    .font(.headline)
                    .foregroundColor(Color("CustomColor"))
                Text("\(playlist.songs.count) songs")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .cornerRadius(10)
    }
}

