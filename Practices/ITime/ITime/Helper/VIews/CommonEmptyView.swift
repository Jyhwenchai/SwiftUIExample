//
//  CommonEmptyView.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct CommonEmptyView: View {
  @State private var offset: CGFloat = 0
  var body: some View {
    VStack {
      Image("empty_box")
      Spacer()
        .frame(height: 10)
      Text("怎么啥都没有")
        .font(.caption)
        .foregroundColor(Color.black.opacity(0.7))
      Spacer()
        .frame(height: 10)
      Button("点我看教程，踏出通往成功的第一部>>") {}
        .font(.footnote)
        .foregroundColor(Color.brown)
        .offset(x: -5)
        .offset(x: offset)
        .animation(
          .linear(duration: 1.5)
          .repeatForever(autoreverses: true),
          value: offset
        )
        .onAppear {
          offset = 20
        }
    }
  }
}

struct CommonEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CommonEmptyView()
    }
}
