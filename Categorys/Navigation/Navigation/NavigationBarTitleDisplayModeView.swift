//
//  navigationBarTitleDisplayModeView.swifN.swift
//  Navigation
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

struct NavigationBarTitleDisplayModeView: View {

  @State private var mode: NavigationBarItem.TitleDisplayMode = .automatic
  var modeDescription: String {
    switch mode {
    case .automatic: "automatic"
    case .inline: "inline"
    case .large: "large"
    default: ""
    }
  }

  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<10, id: \.self) { index in
          Text("Cell \(index)")
        }
      }
      .navigationTitle("navigationBarTitleDisplayMode")
      .navigationBarTitleDisplayMode(mode)
      // 除了使用 `navigationBarTitleDisplayMode` 修改 title 的样式还可以使用 `toolbarTitleDisplayMode` 进行修改
      .toolbarTitleDisplayMode(.automatic)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(modeDescription) {
            switch mode {
            case .automatic: mode = .inline
            case .inline: mode = .large
            case .large: mode = .automatic
            default: mode = .automatic
            }
          }
        }
      }
    }
  }
}

#Preview {
  NavigationBarTitleDisplayModeView()
}
