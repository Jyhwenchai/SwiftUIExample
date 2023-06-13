//
//  Axis.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

struct ScrollAxis: View {
  let items: [Item] = (0..<40).map { Item(text: "item \($0)")}

  var body: some View {
    TabView {
      ScrollView {
        VStack {
          ForEach(items) { item in
            Text(item.text)
          }
        }
      }
      .tabItem { Text("Vertical") }
      .containerRelativeFrame([.vertical, .horizontal])

      ScrollView(.horizontal) {
        HStack {
          ForEach(items) { item in
            Text(item.text)
          }
        }
      }
      .tabItem { Text("Horizatal") }
      .containerRelativeFrame([.vertical, .horizontal])

      ScrollView([.vertical, .horizontal]) {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
          .fill(Color.orange.gradient)
          .frame(width: 1000, height: 2000)
      }
      .tabItem { Text("Horizatal And Vertical") }
      .containerRelativeFrame([.vertical, .horizontal])
    }
  }
}

#Preview {
  ScrollAxis()
}
