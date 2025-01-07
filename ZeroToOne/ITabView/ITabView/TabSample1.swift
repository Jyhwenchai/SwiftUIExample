//
//  TabSample1.swift
//  ITabView
//
//  Created by 蔡志文 on 12/17/24.
//
import SwiftUI

struct TabSample1: View {
  var body: some View {
    TabView {
      Tab("Home", systemImage: "house") {
        Text("Home")
      }

      Tab("Profile", systemImage: "person") {
        Text("Profile")
      }

      Tab("Settings", systemImage: "gear") {
        Text("Settings")
      }

      Tab("Friends", systemImage: "person.3") {
        Text("Friends")
      }

      Tab("Notifications", systemImage: "bell") {
        Text("Notifications")
      }

      Tab("Share", systemImage: "square.and.arrow.up") {
        Text("Share")
      }
    }
//    .tabViewStyle(.page)
//    .tabViewStyle(.sidebarAdaptable)
//    .tabViewStyle(.tabBarOnly)
    .tabViewStyle(.page(indexDisplayMode: .always))
  }
}
