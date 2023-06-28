//
//  SafeAreaInset.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 6/20/23.
//

import SwiftUI
/// `safeAreaInset` 可以添加额外的安全区域
struct SafeAreaInset_: View {
  var body: some View {
    ZStack {
      Color.yellow.border(.red, width: 10)
    }
    .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
      Rectangle().fill(Color.teal)
        .frame(height: 80)
    }
    .ignoresSafeArea()
  }
}

#Preview {
    SafeAreaInset_()
}
