//
//  ContentView.swift
//  SoundSeiDemo
//
//
import SwiftUI

// Define the main content view of the app
// When app is first opened, you see the logo and tap to land on the music screen
struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack { // Use a ZStack to layer the background color and the navigation link
                Color("CustomColor").ignoresSafeArea(.all)
                NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true)) { // Create a link to navigate to MainScreen when the image is tapped
                    Image("SoundseiLogo").resizable() // Logo that is shown with app is first opened
                        .frame(width: 400.0, height: 350.0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
