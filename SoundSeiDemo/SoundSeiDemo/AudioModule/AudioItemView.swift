//
//  AudioItemView.swift
//  SoundSeiDemo
//
//

import Foundation
import SwiftUI

struct AudioItemView: View { // Define a view to display an audio item
    var item: AudioItemModel // The audio item to be displayed
    @State private var showTrackWindow = false // State variable to control the display of the track window
    
    var body: some View {
        HStack { // Use an HStack to arrange views horizontally
            Text(item.title)  // Display the title of the audio item
            Spacer()
            // Create a navigation link to navigate to TrackWindow view when the icon is tapped
            NavigationLink(destination: TrackWindow(audioFileName: item.audioFileName, imageName: item.imageName), label: {
                Image("track_window_icon") // Display an image icon for the track window (currently no icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("CustomColor"))
            })
        }
    }
}
