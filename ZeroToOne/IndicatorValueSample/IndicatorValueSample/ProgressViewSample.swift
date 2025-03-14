//
//  ProgressViewSample.swift
//  IndicatorValueSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct ProgressViewSample: View {
  var body: some View {
    Form {
      LinearProgressDemoView()
      DateRelativeProgressDemoView()
      BorderedProgressViews()
    }
  }
}

#Preview {
  ProgressViewSample()
}

struct LinearProgressDemoView: View {
  @State private var progress = 0.5

  var body: some View {
    VStack {
      ProgressView(value: progress)
      Button("More") { progress += 0.05 }
    }
  }
}

struct DateRelativeProgressDemoView: View {
  let workoutDateRange = Date() ... Date().addingTimeInterval(5 * 60)

  var body: some View {
    ProgressView(timerInterval: workoutDateRange) {
      Text("Workout")
    }
  }
}

struct BorderedProgressViews: View {
  var body: some View {
    VStack {
      ProgressView(value: 0.25) { Text("25% progress") }
      ProgressView(value: 0.75) { Text("75% progress") }
        .progressViewStyle(.circular)
    }
    .progressViewStyle(PinkBorderedProgressViewStyle())
  }
}

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
  func makeBody(configuration: Configuration) -> some View {
    ProgressView(configuration)
      .padding(4)
      .border(.pink, width: 3)
      .cornerRadius(4)
  }
}
