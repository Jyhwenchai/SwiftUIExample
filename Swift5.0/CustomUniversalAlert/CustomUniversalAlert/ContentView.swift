//
//  ContentView.swift
//  CustomUniversalAlert
//
//  Created by 蔡志文 on 11/23/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alert: AlertConfig = .init()
  @State private var alert1: AlertConfig = .init(slideEdge: .top)
  var body: some View {
    Button {
      alert.present()
      alert1.present()
    } label: {
      Text("Show Alert View")
    }
    .alert(alertConfig: $alert) {
      RoundedRectangle(cornerRadius: 15)
        .fill(.red.gradient)
        .frame(width: 150, height: 150)
        .onTapGesture {
          alert.dismiss()
        }
    }
    .alert(alertConfig: $alert1) {
      RoundedRectangle(cornerRadius: 15)
        .fill(.blue.gradient)
        .frame(width: 150, height: 150)
        .onTapGesture {
          alert1.dismiss()
        }
    }
  }
}

#Preview {
  ContentView()
    .environment(SceneDelegate())
}
