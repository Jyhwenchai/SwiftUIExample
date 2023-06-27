//
//  ModifierContainerBackground.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/16/23.
//

import SwiftUI

/// TODO: 等待更新
struct ModifierContainerBackground: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink("Blue") {
          Text("Blue")
//            .containerBackground(.blue.gradient, for: ContainerBackgroundPlacement.navigation)
        }
        NavigationLink("Red") {
          Text("Red")
//            .containerBackground(.red.gradient, for: .navigation)
        }
      }
    }
  }
}

#Preview {
  ModifierContainerBackground()
}
