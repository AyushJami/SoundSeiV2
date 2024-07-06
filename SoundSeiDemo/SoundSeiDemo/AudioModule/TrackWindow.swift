//
//  TrackWindow.swift
//  SoundSeiDemo
//
//

import Foundation
import SwiftUI

struct TrackWindow: View { // Define a view to display a track window with audio controls
    @ObservedObject var audioController = AudioController() // object to control audio playback
    var audioFileName: String // Name of the audio file to be played
    var imageName: String // Name of the image associated with the track
    @State private var isShowingPopup = false // State variable to control popup visibility
    @State private var selectedPlaybackTime = 60.0 // Default selected playback time
    
    var body: some View {
            ZStack {
                VStack {
                    Image(imageName) // Display the image associated with the track
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    HStack {
                        Button(action: {
                            // button functionality for adding to playlist to be added in later
                        }) {
                            Image("add_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("CustomColor"))
                        }
                        
                        Spacer()
                        
                        Button(action: { // Button to play or pause the audio
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
                        
                        Button(action: { // Button to show the playback time adjustment popup
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
                
                // Popup for adjusting playback time, shown when isShowingPopup is true
                if isShowingPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all) // Background dimming
                        .transition(.opacity)
                    
                    // TimeSlider view for adjusting playback time
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
