//
//  ContentView.swift
//  NewTabView
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
  @State var customization = TabViewCustomization()

  var body: some View {
    TabView {
      Tab("Home", systemImage: "house") {
      }
      .customizationID("com.myApp.home")


      Tab("Reports", systemImage: "chart.bar") {
      }
      .customizationID("com.myApp.reports")


      TabSection("Categories") {
        Tab("Climate", systemImage: "fan") {
        }
        .customizationID("com.myApp.climate")


        Tab("Lights", systemImage: "lightbulb") {
        }
        .customizationID("com.myApp.lights")
      }
      .customizationID("com.myApp.browse")
    }
    .tabViewStyle(.sidebarAdaptable)
    .tabViewCustomization($customization)
    .onChange(of: customization) { oldValue, newValue in
      print("old: \(oldValue), new: \(newValue)")
    }
  }
}

#Preview {
  ContentView()
}
