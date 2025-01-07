//
//  ContentView.swift
//  ITabView
//
//  Created by 蔡志文 on 12/17/24.
//

import SwiftUI

enum NavItem: String, Identifiable {
  var id: Self { self }
  case sample1 = "普通"
  case sample2 = "分组"
  case sample3 = "selected"
}

struct ContentView: View {
  @State private var path = NavigationPath()
  var body: some View {
    NavigationStack(path: $path) {
      VStack(spacing: 10) {
        Button("TabView Sample1") {
          path.append(NavItem.sample1)
        }
        Button("TabView Sample2， 分组") {
          path.append(NavItem.sample2)
        }
        Button("TabView Sample3， selection tab item") {
          path.append(NavItem.sample3)
        }
      }
      .navigationTitle("TabView")
      .navigationDestination(for: NavItem.self) { item in
        switch item {
        case .sample1: TabSample1()
        case .sample2: TabSample2()
        case .sample3: TabSample3().hidden()
        }
      }
    }
  }
}

#Preview {
  ContentView()
}

enum TabItem: Identifiable {
  var id: Self { self }
  case home
  case profile
  case settings
  case friends
}

struct TabSample3: View {
  @State private var currentTabItem: TabItem = .home
  var body: some View {
    TabView(selection: $currentTabItem) {
      Tab("Home", systemImage: "house", value: .home) {
        Text("Home")
      }

      Tab("Profile", systemImage: "person", value: .profile) {
        Text("Profile")
      }

      Tab("Settings", systemImage: "gear", value: .settings) {
        Text("Settings")
      }

      Tab("Friends", systemImage: "person.3", value: .friends) {
        Text("Friends")
      }
    }
  }
}
