//
//  ContentView.swift
//  MealPlanner
//
//  Created by 蔡志文 on 1/12/24.
//

import SwiftUI

struct ContentView: View {

  init() {
  }

  var body: some View {
    VStack {
      TagLayout {
        Text("Hello, World")
        Circle()
          .frame(width: 40, height: 40)
      }
      .frame(width: 200, height: 300)
    }
    .frame(width: 300, height: 300)

  }

  var font: some View {
    NavigationStack {
      List {
        Text("Large Title-35")
          .font(.title)
        Text("Title-28")
          .font(.title)
        Text("Title2-22")
          .font(.title2)
        Text("Title3-20")
          .font(.title3)
        Text("Headine-17-sembold")
          .font(.headline)
        Text("Body-17")
          .font(.body)
        Text("Callout-16")
          .font(.callout)
        Text("Subhead-15")
          .font(.subheadline)
        Text("Footnote-13")
          .font(.footnote)
        Text("Caption 1-12")
          .font(.caption)
        Text("Caption 2-11")
          .font(.caption2)
      }
    }
  }
}

#Preview {
    ContentView()
}
