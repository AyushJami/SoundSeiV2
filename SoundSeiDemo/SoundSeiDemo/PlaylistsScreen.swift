//
//  PlaylistsScreen.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 3/24/24.
//

import SwiftUI

struct PlaylistsScreen: View { // Define the playlists screen view of the app
    
    @ObservedObject var viewModel = PlaylistViewModel()
    @State private var isRowSelected = false
        
        var body: some View {
            NavigationView {
                ZStack {
                    
                    
                    VStack {
                        
                        if !isRowSelected{
                            HStack {
                                Button("Edit") {
                                    // Add edit functionality here
                                }
                                .padding(.leading)
                                .foregroundColor(Color("CustomColor"))
                                
                                Spacer()
                                
                                Text("Playlists")
                                    .font(.title)
                                    .foregroundColor(Color("CustomColor"))
                                
                                Spacer()
                                
                                Button("Info") {
                                    // Add functionality here
                                }
                                .padding(.trailing)
                                .foregroundColor(Color("CustomColor"))
                            }
                            .padding(.vertical)
                        }
                        
                        
                        NavigationView{
                            
                            List(viewModel.playlists) { playlist in
                                NavigationLink(destination: PlaylistDetailView(playlist:playlist).onAppear {
                                    isRowSelected = true
                                }
                                .onDisappear {
                                    isRowSelected = false
                                }) {
                                    PlaylistRowView(playlist: playlist)
                                    
                                }
                            }
                            .background(Color("CustomColor"))
                            .scrollContentBackground(.hidden)
                             
                        }
                        
                    }
                }
                .navigationBarHidden(true)
            }
        }
}

#Preview {
    PlaylistsScreen()
}
