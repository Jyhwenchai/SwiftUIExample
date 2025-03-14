//
//  GaugeSample.swift
//  IndicatorValueSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct GaugeSample: View {
  @State private var batteryLevel = 0.4

  var body: some View {
    Form {
      Gauge(value: batteryLevel) {
        Text("Battery Level")
      }
      LabeledGauge()
    }
  }
}

#Preview {
  GaugeSample()
}

struct LabeledGauge: View {
  @State private var current = 67.0
  @State private var minValue = 0.0
  @State private var maxValue = 170.0

  var body: some View {
    Gauge(value: current, in: minValue ... maxValue) {
      Text("BPM")
    } currentValueLabel: {
      Text("\(Int(current))")
    } minimumValueLabel: {
      Text("\(Int(minValue))")
    } maximumValueLabel: {
      Text("\(Int(maxValue))")
    }
    .gaugeStyle(.accessoryCircularCapacity)
  }
}
