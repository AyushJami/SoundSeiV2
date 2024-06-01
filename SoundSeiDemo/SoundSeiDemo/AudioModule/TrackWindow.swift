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
    @State private var isShowingPopup = false
    @State private var selectedPlaybackTime = 60.0 // Default selected playback time
    
    var body: some View {
            ZStack {
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    HStack {
                        Button(action: {
                            //add button action
                        }) {
                            Image("add_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("CustomColor"))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if audioController.isPlaying {
                                audioController.stopSound()
                            } else {
                                audioController.playSound(audioFileName: audioFileName, playbackTime: selectedPlaybackTime)
                            }
                        }) {
                            Image(audioController.isPlaying ? "pause_button" : "play_button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("CustomColor"))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isShowingPopup.toggle() // Toggle popup visibility
                        }) {
                            Image("clock_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("CustomColor"))
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack does not exceed available width
                    .padding(.horizontal, 25) // Add some horizontal padding
                    
                }
                
                if isShowingPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all) // Background dimming
                        .transition(.opacity)
                    
                    TimeSlider(audioController: audioController, isShowingPopup: $isShowingPopup, selectedPlaybackTime: $selectedPlaybackTime)
                        .frame(width: 300, height: 200) // Size of the popup
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .transition(.scale)
                }
            }
        }
}
