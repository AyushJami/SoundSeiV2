//
//  TimeSlider.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 5/31/24.
//

import Foundation
import SwiftUI

struct TimeSlider: View {
    @ObservedObject var audioController: AudioController
    @Binding var isShowingPopup: Bool // To dismiss the sheet
    @Binding var selectedPlaybackTime: Double // Binding for selected playback time
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Text("Modify Playback Time")
                .font(.headline)
                .padding()
            Slider(
                value: $selectedPlaybackTime,
                in: 1...30*60,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            Text(timeString(selectedPlaybackTime))
                .foregroundColor(isEditing ? .red : .blue)
                
            Button("Done") {
                isShowingPopup = false // Dismiss the popup
            }
            .padding()
        }
        .padding()
    }
    
    private func timeString(_ timeInSeconds: Double) -> String {
            let minutes = Int(timeInSeconds) / 60
            let seconds = Int(timeInSeconds) % 60
            if minutes > 0 {
                return String(format: "%02d:%02d", minutes, seconds)
            } else {
                return String(format: "%02d", seconds)
            }
        }
}
