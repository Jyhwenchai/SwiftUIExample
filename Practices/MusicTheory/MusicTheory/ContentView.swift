//
//  ContentView.swift
//  MusicTheory
//
//  Created by 蔡志文 on 10/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        List {
          ForEach(musicTheoryList) { item in
            NavigationLink(item.title) {
              item.view
                .navigationTitle(item.title)
            }
          }
        }
        .navigationTitle("Music")
      }
    }
}

#Preview {
    ContentView()
}
