//
//  SoundsScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI

struct SoundsScreen: View {
    let soundItems = [
        AudioItemModel(title: "Sound 1", audioFileName: "Music/city_birds_waking_rain2.m4a", imageName: "city_birds_waking_rain640x480", category: "urban"),
        AudioItemModel(title: "Sound 2", audioFileName: "Music/city_birds_waking_rain2.m4a", imageName: "city_birds_waking_rain640x48", category: "urban"),
    ]

    var body: some View {
        AudioListView(items: soundItems, title: "Soundscapes")
    }
}


#Preview {
    SoundsScreen()
}
