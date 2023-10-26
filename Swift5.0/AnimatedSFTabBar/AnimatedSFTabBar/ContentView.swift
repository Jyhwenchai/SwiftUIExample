//
//  ContentView.swift
//  AnimatedSFTabBar
//
//  Created by 蔡志文 on 9/1/23.
//

import SwiftUI

struct ContentView: View {
  @State private var activeTab: Tab = .photos
  @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { AnimatedTab(tab: $0) }
  var body: some View {
    VStack(spacing: 0) {
      TabView(selection: $activeTab) {
        NavigationStack {
          List {
            ForEach(0..<16, id: \.self) { index in
              NavigationLink(destination: {
                Text("Page \(index)")
              }, label: {
                Text("\(index)")
              })
            }
          }
            .navigationTitle(Tab.photos.title)
        }
        .setupTab(Tab.photos)

        NavigationStack {
          VStack {}
            .navigationTitle(Tab.chat.title)
        }
        .setupTab(Tab.chat)

        NavigationStack {
          VStack {}
            .navigationTitle(Tab.apps.title)
        }
        .setupTab(Tab.apps)

        NavigationStack {
          VStack {}
            .navigationTitle(Tab.notifications.title)
        }
        .setupTab(Tab.notifications)

        NavigationStack {
          VStack {}
            .navigationTitle(Tab.profile.title)
        }
        .setupTab(Tab.profile)

      }

      CustomTabBar()
    }
  }

  @ViewBuilder
  func CustomTabBar() -> some View {
    HStack(spacing: 0) {
      ForEach($allTabs) { $animatedTab in
        let tab = animatedTab.tab

        VStack(spacing: 4) {
          Image(systemName: tab.rawValue)
            .font(.title2)
            .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)

          Text(tab.title)
            .font(.caption2)
            .textScale(.secondary)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
        .padding(.top, 15)
        .padding(.bottom, 10)
        .contentShape(.rect)
        .onTapGesture {
          withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
            activeTab = tab
            animatedTab.isAnimating = true
          } completion: {
            var transaction = Transaction()
            transaction.disablesAnimations = true
            withTransaction(transaction) {
              animatedTab.isAnimating = nil
            }
          }
        }
      }
    }
    .background(.bar)
  }
}

#Preview {
    ContentView()
}

extension View {
  @ViewBuilder
  func setupTab(_ tab: Tab) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .tag(tab)
      .toolbar(.hidden, for: .tabBar)
  }
}
