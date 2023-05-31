//
//  Overview.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct Overview: View {
  @State private var isEmpty: Bool = false
  @State private var showCalendar: Bool = false
  @State private var selectedDate = Date()
  @State private var coverOpacity: Double = 0
  @Binding var navigationPath: NavigationPath

  var body: some View {
    VStack(spacing: 0) {
      DateSelectHeader(showCalendar: $showCalendar) {

      } after: {

      }

      Divider()
        .opacity(0.5)

      VStack {
        if !isEmpty {
          OverviewList()
        } else {
          Spacer()
          CommonEmptyView()
          Spacer()
        }
      }
      .overlay(alignment: .bottom) {
        TimeAddButton {
          navigationPath.append("A")
        } clockAction: {
          navigationPath.append(5)
        }

      }
    }
    .fullScreenCover(isPresented: $showCalendar, content: {
      VStack {
        OverviewCalendar(selectedDate: $selectedDate, isShow: $showCalendar)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(TransparentBackground())
    })
    .navigationDestination(for: String.self) { path in
      AddDaily()
        .toolbar(.hidden, for: .tabBar)
    }
    .navigationDestination(for: Int.self) { path in
      Chronoscope()
        .toolbar(.hidden, for: .tabBar)
    }
  }
}

struct Overview_Previews: PreviewProvider {
  static var previews: some View {
    Overview(navigationPath: .constant(NavigationPath()))
  }
}
