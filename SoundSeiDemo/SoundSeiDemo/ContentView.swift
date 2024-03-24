//
//  ContentView.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/6/24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("CustomColor").ignoresSafeArea(.all)
                NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true)) {
                    Image("SoundseiLogo").resizable()
                        .frame(width: 400.0, height: 350.0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
