//
//  ContainerKeyAndValues.swift
//  ContainerKey_Values
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

/**
 - ContainerKey/Values

 Every individual view has associated container values, which the SubViews can read.

 NOTE: Regular SwiftUI views cannot read the container values.
 */

struct ContainerKeyAndValues: View {
  var body: some View {
    CustomView {
      ForEach(0...10, id: \.self) { index in
        RoundedRectangle(cornerRadius: 15)
          .fill(.red.gradient)
          .containerValue(\.floatIndex, CGFloat(index))
      }
    }
    .padding(15)
  }
}

struct CustomView<Content: View>: View {
  @ViewBuilder var content: Content
  var body: some View {
    VStack(spacing: 10) {
      ForEach(subviews: content) { subView in
        let index = subView.containerValues.floatIndex
        subView
          .overlay {
            Text("\(index)")
          }
      }
    }
  }
}

struct ViewKey: ContainerValueKey {
  static var defaultValue: CGFloat = 0.0
}

extension ContainerValues {
  var floatIndex: CGFloat {
    get { self[ViewKey.self] }
    set {
      self[ViewKey.self] = newValue
    }
  }
}

#Preview {
  ContainerKeyAndValues()
}
