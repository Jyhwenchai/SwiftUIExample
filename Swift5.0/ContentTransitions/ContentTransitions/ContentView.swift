//
//  ContentView.swift
//  ContentTransitions
//
//  Created by 蔡志文 on 8/31/23.
//

import SwiftUI

struct ContentView: View {
  @State private var text = 0
  @State private var sfImage = "house.fill"
  @State private var sfCount = 1

  var body: some View {
    VStack {
      Image(systemName: sfImage)
        .font(.largeTitle.bold())
        .contentTransition(.symbolEffect(.automatic))
      Button {
        let images = ["suit.heart.fill", "house.fill", "gearshape", "person.circle.fill", "iphone", "macbook"]
        withAnimation(.bouncy) {
          sfCount += 1
          sfImage = images[sfCount % images.count]
        }
      } label: {
        Text("change image")
      }
      .padding()


      Text("$\(text)")
        .font(.largeTitle.bold())
        .contentTransition(.numericText(value: Double(text)))

      Button {
        withAnimation(.bouncy) {
          text = .random(in: 100...1000000)
        }
      } label: {
        Text("update")
      }
      .padding()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
