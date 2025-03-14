//
//  ContentView.swift
//  ControlsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
  @State private var speed = 50.0
  @State private var isEditing = false

  var body: some View {
    VStack {
      Slider(
        value: $speed,
        in: 0 ... 100,
        onEditingChanged: { editing in
          isEditing = editing
        }
      )
      Slider(
        value: $speed,
        in: 0 ... 100,
        step: 5
      ) {
        Text("Speed")
      } minimumValueLabel: {
        Text("0")
      } maximumValueLabel: {
        Text("100")
      } onEditingChanged: { editing in
        isEditing = editing
      }
      Text("\(speed)")
        .foregroundColor(isEditing ? .red : .blue)
    }
  }
}

#Preview {
  ContentView()
}
