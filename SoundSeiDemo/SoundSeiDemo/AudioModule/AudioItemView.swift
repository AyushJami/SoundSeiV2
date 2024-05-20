//
//  AudioItemView.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 5/19/24.
//

import Foundation
import SwiftUI

struct AudioItemView: View {
    var item: AudioItemModel
    @State private var showTrackWindow = false
    
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            NavigationLink(destination: TrackWindow(audioFileName: item.audioFileName, imageName: item.imageName)){
                Image("track_window_icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("CustomColor"))
            }
        }
    }
}
