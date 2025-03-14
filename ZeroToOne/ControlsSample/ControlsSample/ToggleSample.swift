//
//  ToggleSample.swift
//  ControlsSample
//
//  Created by 蔡志文 on 1/14/25.
//

import SwiftUI

struct Alarm: Hashable, Identifiable {
  var id = UUID()
  var isOn = false
  var name = ""
}

struct ToggleSample: View {
  @State private var vibrateOnRing = false
  @State private var alarms = [
    Alarm(isOn: true, name: "Morning"),
    Alarm(isOn: false, name: "Evening")
  ]

  var body: some View {
    Form {
      Toggle(isOn: $vibrateOnRing) {
        Text("Vibrate on Ring")
      }
      Toggle(
        "Vibrate on Ring",
        systemImage: "dot.radiowaves.left.and.right",
        isOn: $vibrateOnRing
      )
      Toggle(isOn: $vibrateOnRing) {
        Text("Vibrate on Ring")
        Text("Enable vibration when the phone rings")
      }

      Toggle("Enable all alarms", systemImage: "alarm", sources: $alarms, isOn: \.isOn)
      Toggle(sources: $alarms, isOn: \.isOn) {
        Text("Enable all alarms")
      }
    }
    .toggleStyle(.switch)
  }
}

#Preview {
  ToggleSample()
}
