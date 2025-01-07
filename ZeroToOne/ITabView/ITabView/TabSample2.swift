//
//  TabSample2.swift
//  ITabView
//
//  Created by 蔡志文 on 12/17/24.
//
import SwiftUI


/// 分组, 大屏下有效
struct TabSample2: View {
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

      // using tab section you can group items into sections in the side bar
      TabSection("More") {
        Tab("Notifications", systemImage: "bell") {
          Text("Notifications")
        }

        Tab("Share", systemImage: "square.and.arrow.up") {
          Text("Share")
        }
      }
      // you can add actions directly into the sidebar with the section action modifier
      .sectionActions {
        Button("New Friend", systemImage: "plus") {
          print("I added a new friend")
        }
      }
    }
    .tabViewStyle(.sidebarAdaptable)
  }
}
