//
//  TrackWindow.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 5/19/24.
//

import Foundation
import SwiftUI

struct TrackWindow: View {
    @ObservedObject var audioController = AudioController()
    var audioFileName: String
    var imageName: String
    
    var body: some View {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            HStack {
                Spacer()
                Button(action: {
                    if audioController.isPlaying {
                        audioController.stopSound()
                    } else {
                        audioController.playSound(audioFileName: audioFileName)
                    }
                }) {
                    Image(audioController.isPlaying ? "pause_button" : "play_button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("CustomColor"))
                }
                Spacer()
            }
        }
}
