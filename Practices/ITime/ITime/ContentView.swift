//
//  ContentView.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

struct ContentView: View {
  @State private var selection = 0

  var body: some View {
    TabView(selection: $selection) {
      Time()
        .tabItem {
          TabItem(tab: .time, selectedIndex: $selection)
        }
        .tag(Tab.time.rawValue)
      Target()
        .tabItem {
          TabItem(tab: .target, selectedIndex: $selection)
        }
        .tag(Tab.target.rawValue)
      Mine()
        .tabItem {
          TabItem(tab: .mine, selectedIndex: $selection)
        }
        .tag(Tab.mine.rawValue)
    }
    .tint(Color.black.opacity(0.7))
  }
}

struct TabItem: View {
  let tab: Tab
  @Binding var selectedIndex: Int
  var body: some View {
    VStack {
      let isSelected = selectedIndex == tab.rawValue
      Image(isSelected ? tab.tabIcon.selected : tab.tabIcon.normal)
      Text(tab.tabName)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

enum Tab: Int, Hashable, RawRepresentable {
  case time = 0
  case target = 1
  case mine = 2

  typealias TabIcon = (normal: String, selected: String)
  var tabIcon: TabIcon {
    switch self {
    case .time: return ("ic_24_hour_nor25x25", "ic_24_hour_sel25x25")
    case .target: return ("ic_nav_target_nor25x25", "ic_nav_target_sel25x25")
    case .mine: return ("ic_nav_user_nor25x25", "ic_nav_user_sel25x25")
    }
  }
  var tabName: String {
    switch self {
    case .time: return "时间"
    case .target: return "目标"
    case .mine: return "我的"
    }
  }
}
