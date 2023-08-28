//
//  ContentView.swift
//  TabBarSheet
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

struct ContentView: View {
  @Environment(WindowSharedModel.self) private var windowSharedModel
  @Environment(SceneDelegate.self) private var sceneDelegate
  var body: some View {
    @Bindable var bindableObject = windowSharedModel
    TabView(selection: $bindableObject.activeTab) {
      NavigationStack {
        Text("People")
      }
      .tag(Tab.people)
      .hideNativeTabBar()

      NavigationStack {
        Text("Devices")
      }
      .tag(Tab.devices)
      .hideNativeTabBar()

      NavigationStack {
        Text("Items")
      }
      .tag(Tab.items)
      .hideNativeTabBar()

      NavigationStack {
        Text("Me")
      }
      .tag(Tab.me)
      .hideNativeTabBar()
    }
    .tabSheet(initialHeight: 110, sheetCornerRadius: 15) {
      NavigationStack {
        ScrollView {
          VStack(spacing: 15) {
            if windowSharedModel.activeTab == .devices {
              DeviceRowView("iphone", "iJustine's iPhone", "Home")
              DeviceRowView("ipad", "iJustine's iPad", "Home")
              DeviceRowView("applewatch", "iJustine's Watch Ultra", "Home")
            }
          }
          .padding(.horizontal, 15)
          .padding(.vertical, 10)
        }
        .scrollIndicators(.hidden)
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Text(windowSharedModel.activeTab.title)
              .font(.title3.bold())
          }

          if windowSharedModel.activeTab == .devices {
            ToolbarItem(placement: .topBarTrailing) {
              Button {

              } label: {
                Image(systemName: "plus")
              }
            }
          }
        }
      }
    }
    .onAppear {
      guard sceneDelegate.tabWindow == nil else { return }
      sceneDelegate.addTabBar(windowSharedModel)
    }
  }

  @ViewBuilder
  func DeviceRowView(_ image: String, _ title: String, _ subTitle: String) -> some View {
    HStack(spacing: 12) {
      Image(systemName: image)
        .font(.title2)
        .padding(12)
        .background(.background, in: .circle)

      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .fontWeight(.bold)

        Text(subTitle)
          .font(.caption)
          .foregroundStyle(.gray)
      }
      .frame(maxWidth: .infinity, alignment: .leading)

      Text("0 km")
        .font(.callout)
    }
  }
}

struct CustomTabBar: View {
  @Environment(WindowSharedModel.self) private var windowShareModel
  var body: some View {
    VStack(spacing: 0) {
      Divider()
      HStack(spacing: 0) {
        ForEach(Tab.allCases, id: \.rawValue) { tab in
          Button {
            windowShareModel.activeTab = tab
          } label: {
            VStack {
              Image(systemName: tab.rawValue)
                .font(.title2)

              Text(tab.title)
                .font(.caption)
            }
            .foregroundStyle(windowShareModel.activeTab == tab ? Color.accentColor : .gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(.rect)
          }
        }
      }
      .frame(height: 55)
    }
    .background(.regularMaterial)
  }
}

#Preview {
  ContentView()
}
