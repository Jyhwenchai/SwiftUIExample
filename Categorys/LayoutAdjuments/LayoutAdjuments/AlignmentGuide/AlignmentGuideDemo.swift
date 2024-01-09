//
//  AlignmentGuideDemo.swift
//  LayoutAdjuments
//
//  Created by 蔡志文 on 1/5/24.
//

import SwiftUI

struct AlignmentGuideDemo: View {
  @State private var selectedIdx = 1

  let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  var body: some View {
    HStack(alignment: .myAlignment) {
      Image(systemName: "arrow.right.circle.fill")
        .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.center] })
        .foregroundColor(.green)

      VStack(alignment: .leading) {
        ForEach(days.indices, id: \.self) { idx in
          Group {
            if idx == self.selectedIdx {
              Text(self.days[idx])
                .transition(AnyTransition.identity)
                .alignmentGuide(.myAlignment, computeValue: { d in 
//                  d[VerticalAlignment.center]
                  let value = d[VerticalAlignment.center]
                  print(value)
                  return value
                })
            } else {
              Text(self.days[idx])
                .transition(AnyTransition.identity)
                .onTapGesture {
                  withAnimation {
                    self.selectedIdx = idx
                  }
                }
            }
          }
        }
      }
    }
    .padding(20)
    .font(.largeTitle)
  }
}

#Preview {
  AlignmentGuideDemo()
}

extension VerticalAlignment {
  private enum MyAlignment : AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat {
      let value = d[VerticalAlignment.center]
      return value
    }
  }
  static let myAlignment = VerticalAlignment(MyAlignment.self)
}
