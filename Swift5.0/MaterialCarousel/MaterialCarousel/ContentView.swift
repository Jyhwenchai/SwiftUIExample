//
//  ContentView.swift
//  MaterialCarousel
//
//  Created by 蔡志文 on 7/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        Home()
          .navigationTitle("Carousel")
      }
    }
}

#Preview {
    ContentView()
}
