//
//  StepSample.swift
//  ControlsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct StepSample: View {
  @State private var value = 0
  let colors: [Color] = [.orange, .red, .gray, .blue,
                         .green, .purple, .pink]

  func incrementStep() {
    value += 1
    if value >= colors.count { value = 0 }
  }

  func decrementStep() {
    value -= 1
    if value < 0 { value = colors.count - 1 }
  }

  var body: some View {
    Stepper {
      Text("Value: \(value) Color: \(colors[value].description)")
    } onIncrement: {
      incrementStep()
    } onDecrement: {
      decrementStep()
    } onEditingChanged: { isEditing in
      print("is editing: \(isEditing)")
    }
    .padding(5)
    .background(colors[value])
  }
}

#Preview {
  StepSample()
}
