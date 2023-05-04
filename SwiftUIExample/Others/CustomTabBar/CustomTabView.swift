//
//  CustomTabView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 4/20/23.
//  Copyright © 2023 蔡志文. All rights reserved.
//

import SwiftUI
private enum Tab: String, CaseIterable  {
  case dashboard = "plus.square.dashed"
  case analytics = "scribble.variable"
  case settings = "pencil"
}

struct CustomTabView: View {
  //HIDING NATIVE TAB BAR
  init(){
    UITabBar.appearance().isHidden = true
  }

  @State private var currentTab: Tab = .dashboard
  @State private var isPush: Bool = false

  var body: some View {
    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
      TabView(selection: $currentTab){
        ContentView(isPush: $isPush)
          .tag(Tab.dashboard)
        Text("Analytics")
          .tag(Tab.analytics)
        Text("Settings")
          .tag(Tab.settings)
      }

      CustomTabBar(currentTab: $currentTab)
        .opacity(isPush ? 0 : 1)
        .animation(
          Animation.easeInOut(duration: 0.15)
        )
    }
  }
}

private struct ContentView: View {
  @Binding var isPush: Bool
  var body: some View {
    NavigationView {
      VStack {
        Button("Push") {
          isPush = true
        }
        .padding()
        NavigationLink(
          destination: Text("Hello, World"),
          isActive: $isPush,
          label: { EmptyView() }
        )
      }
      .navigationBarTitle(Text("首页"))
    }
  }
}

private struct CustomTabBar: View {
  @Binding var currentTab: Tab

  var body: some View {
    GeometryReader{proxy in
      HStack(spacing: 0) {
        ForEach(Tab.allCases, id: \.rawValue){tab in
          Button{
            withAnimation(.easeInOut(duration: 0.2)){
              currentTab = tab
            }
          } label: {
            Image(systemName: tab.rawValue)
              .renderingMode(.template)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 30, height: 30)
              .frame(maxWidth: .infinity)
              .foregroundColor(currentTab == tab ? Color.white : Color.white.opacity(0.75))
          }
        }
      }
      .frame(maxWidth: .infinity)
    }
    .frame(height: 30)
    .padding(.bottom, 10)
    .padding([.horizontal, .top])
    .background {
      Color.orange
        .ignoresSafeArea()
    }
  }
}

struct CustomTabView_Previews: PreviewProvider {
  static var previews: some View {
    CustomTabView()
  }
}
