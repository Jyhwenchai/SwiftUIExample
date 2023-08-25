//
//  ContentView.swift
//  ScrollToHideTabBar
//
//  Created by 蔡志文 on 8/11/23.
//

import SwiftUI

struct ContentView: View {
  @State private var tabState: Visibility = .visible
  var body: some View {
    TabView {
      NavigationStack {
        TabStateScrollView(axis: .vertical, showIndicator: false, tabState: $tabState) {
          VStack(spacing: 15) {
            ForEach(1...8, id: \.self) { index in
              GeometryReader(content: { geometry in
                let size = geometry.size
                Image("img\(index)")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: size.width, height: size.height)
                  .clipShape(.rect(cornerRadius: 12))
              })
              .frame(height: 180)
            }
          }
          .padding(15)
        }
        .navigationTitle("Home")
      }

      .toolbar(tabState, for: .tabBar)
      .animation(.easeInOut(duration: 0.3), value: tabState)

      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }

      Text("Favourites")
        .tabItem {
          Image(systemName: "suit.heart")
          Text("Favourites")
        }

      Text("Notifications")
        .tabItem {
          Image(systemName: "bell")
          Text("Notifications")
        }

      Text("Account")
        .tabItem {
          Image(systemName: "person")
          Text("Account")
        }
    }
  }
}

#Preview {
  ContentView()
}
