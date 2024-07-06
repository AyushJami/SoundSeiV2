//
//  SoundsScreen.swift
//  SoundSeiDemo
//
//

import SwiftUI

struct SoundsScreen: View { // Define the sounds screen view of the app
    let soundItems = [ // Define a list of audio items
        // Create an audio item model for each sound with its title, audio file name, image name, and category
        AudioItemModel(title: "Sound 1", audioFileName: "Music/city_birds_waking_rain2.m4a", imageName: "city_birds_waking_rain640x480", category: "urban"),
        AudioItemModel(title: "Sound 2", audioFileName: "Music/city_birds_waking_rain2.m4a", imageName: "city_birds_waking_rain640x48", category: "urban"),
        
        //add rest of sounds here
    ]

    var body: some View {
        // Use the AudioListView to display the list of sound items
        AudioListView(items: soundItems, title: "Soundscapes")
    }
}


#Preview {
    SoundsScreen()
}
