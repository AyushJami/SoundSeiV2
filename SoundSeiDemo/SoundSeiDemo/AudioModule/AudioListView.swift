//
//  AudioListView.swift
//  SoundSeiDemo
//
//

import Foundation
import SwiftUI

struct AudioListView: View { // Define a view to display a list of audio items
    let items: [AudioItemModel] // Array of audio items to be displayed
    let title: String // Title of the list

    var body: some View {
        VStack {
            Text(title).font(.title).foregroundStyle(Color("CustomColor")) // Display the title of the list
            // Create a navigation view to manage navigation within the list
            NavigationView {
                List { // Create a list to display audio items
                    // Iterate over each item in the items array
                    ForEach(items, id: \.title) { item in
                        AudioItemView(item: item) // Display each item using the AudioItemView
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("CustomColor"))
            }
        }
    }
}
