//
//  NavigationBarBackButtonHiddenView.swift
//  Navigation
//
//  Created by 蔡志文 on 6/28/23.
//

import SwiftUI

/// `navigationBarBackButtonHidden` 会隐藏导航栏默认的返回视图，同时也会导致右滑返回手势失效
struct NavigationBarBackButtonHiddenView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<10, id: \.self) { index in
          NavigationLink("Cell \(index)") {
            NavigationBarBackButtonHiddenDetail()
          }
        }
      }
      .navigationTitle("navigationBarBackButtonHidden")
    }
  }
}

struct NavigationBarBackButtonHiddenDetail: View {
  @Environment(\.dismiss) private var dismiss
  var body: some View {
    Button("back") {
      dismiss()
    }
    .navigationTitle("Detail")
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  NavigationBarBackButtonHiddenView()
}
