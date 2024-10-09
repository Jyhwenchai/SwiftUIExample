//
//  ContentView.swift
//  CustomContainerViews
//
//  Created by 蔡志文 on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      CustomView {
        ForEach(0...10, id: \.self) { index in
          RoundedRectangle(cornerRadius: 15)
            .fill(.red.gradient)
            .frame(height: 45)
        }
      }
      .padding(15)
    }
}

struct CustomView<Content: View>: View {
  @ViewBuilder var content: Content
  var body: some View {
    VStack(spacing: 10) {
      Group(subviewsOf: content) { collection in
        ForEach(collection) { subView in
          let index = collection.firstIndex { $0.id == subView.id }
          subView
            .overlay {
              if let index {
                Text("\(index)")
                  .font(.largeTitle.bold())
              }
            }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
