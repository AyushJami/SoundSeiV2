//
//  AudioListView.swift
//  SoundSeiDemo
//
//  Created by Angela Xu on 5/19/24.
//

import Foundation
import SwiftUI

struct AudioListView: View {
    let items: [AudioItemModel]
    let title: String

    var body: some View {
        VStack {
            Text(title).font(.title).foregroundStyle(Color("CustomColor"))
            NavigationView {
                List {
                    ForEach(items, id: \.title) { item in
                        AudioItemView(item: item)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("CustomColor"))
            }
        }
    }
}
