//
//  SafeAreaPadding_.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/20/23.
//

import SwiftUI
/// `safeAreaPadding` 为视图添加额外的外边距
struct SafeAreaPadding_: View {
  var body: some View {
    ScrollView {
      ZStack {
        Color.yellow
          .border(Color.red, width: 10)
        Text("Hello, World")
      }
      .containerRelativeFrame([.vertical, .horizontal])
    }
    .safeAreaPadding(.vertical, 20)
    .safeAreaInset(edge: .bottom, spacing: 0) {
      Rectangle()
        .fill(Color.teal)
        .frame(height: 100)
    }
    .ignoresSafeArea()
  }
}

#Preview {
    SafeAreaPadding_()
}
