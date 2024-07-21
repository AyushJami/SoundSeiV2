//
//  TimeSlider.swift
//  SoundSeiDemo
//
//

import Foundation
import SwiftUI

struct TimeSlider: View { // Define a view to display a time slider for modifying playback time
    @ObservedObject var audioController: AudioController // object to control audio playback
    @Binding var isShowingPopup: Bool // To dismiss the sheet
    @Binding var selectedPlaybackTime: Double // Binding for selected playback time
    @State private var isEditing = false // State variable to track editing state
    
    var body: some View {
        VStack {
            Text("Modify Playback Time") // Title text for the slider
                .font(.headline)
                .padding()
            Slider( // Slider to adjust the playback time
                value: $selectedPlaybackTime, // Bind slider value to selectedPlaybackTime
                in: 1...30*60, // Allow values between 1 second and 30 minutes (1800 seconds)
                onEditingChanged: { editing in
                    isEditing = editing  // Update editing state when slider is being edited
                }
            )
            Text(timeString(selectedPlaybackTime)) // Display the selected playback time as a formatted string
                .foregroundColor(isEditing ? .red : .blue)
            Button("Done") { // Button to dismiss the popup
                isShowingPopup = false
            }
            .padding()
        }
        .padding()
    }

    // Function to convert time in seconds to a formatted string
    private func timeString(_ timeInSeconds: Double) -> String {
            let minutes = Int(timeInSeconds) / 60 // Calculate minutes
            let seconds = Int(timeInSeconds) % 60 // Calculate remaining seconds
            // Format the time string based on minutes and seconds
            if minutes > 0 {
                return String(format: "%02d:%02d", minutes, seconds) // Format as mm:ss if minutes are greater than 0
        }
        else {
            return String(format: "%02d", seconds) // Format as ss if only seconds are present
            }
        }
}
