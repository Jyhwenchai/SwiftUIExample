//
//  SegmentedView.swift
//  ITime
//
//  Created by 蔡志文 on 5/15/23.
//

import SwiftUI

struct SegmentedView: View {
  let color: Color
  let selectedColor: Color
  let itemSize: Double
  let contents: [AnyView]
  let style: SegmentedStyle

  enum SegmentedStyle {
    case capsule
    case roundCorner(Int)
  }

  @Binding var selectedIndex: Int

  init<C0, C1>(
    color: Color,
    selectedColor: Color,
    selectedIndex: Binding<Int>,
    itemSize: Double? = nil,
    style: SegmentedStyle = .capsule,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1)>
  ) where C0: View, C1: View {
    self.color = color
    self.selectedColor = selectedColor
    self._selectedIndex = selectedIndex
    self.itemSize = itemSize ?? 44
    let tuple = content().value
    self.contents = [AnyView(tuple.0), AnyView(tuple.1)]
    self.style = style
  }

  init<C0, C1, C2>(
    color: Color,
    selectedColor: Color,
    selectedIndex: Binding<Int>,
    itemSize: Double? = nil,
    style: SegmentedStyle = .capsule,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2)>
  ) where C0: View, C1: View, C2: View {
    self.color = color
    self.selectedColor = selectedColor
    self._selectedIndex = selectedIndex
    self.itemSize = itemSize ?? 44
    let tuple = content().value
    self.contents = [AnyView(tuple.0), AnyView(tuple.1), AnyView(tuple.2)]
    self.style = style
  }

  init<C0, C1, C2, C3>(
    color: Color,
    selectedColor: Color,
    selectedIndex: Binding<Int>,
    itemSize: Double? = nil,
    style: SegmentedStyle = .capsule,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3)>
  ) where C0: View, C1: View, C2: View, C3: View {
    self.color = color
    self.selectedColor = selectedColor
    self._selectedIndex = selectedIndex
    self.itemSize = itemSize ?? 44
    let tuple = content().value
    self.contents = [AnyView(tuple.0), AnyView(tuple.1), AnyView(tuple.2), AnyView(tuple.3)]
    self.style = style
  }

  var body: some View {
    styleView()
      .frame(width: Double(contents.count) * itemSize)
      .background {
        HStack(spacing: 0) {
          ForEach(0..<contents.count, id: \.self) { index in
            Button {
              print("clicked index: \(index)")
              selectedIndex = index
            } label: {
              contents[index]
                .foregroundColor(selectedIndex == index ? color : selectedColor)
                .frame(width: itemSize)
                .frame(maxHeight: .infinity)
                .background(selectedIndex == index ? selectedColor : color)
            }
            if index < contents.count - 1 {
              Divider()
                .background(selectedColor)
            }
          }
        }
      }
      .clipShape(getClipShape())
  }

  func styleView() -> some View {
    switch style {
    case .capsule:
      return AnyView(
        Capsule()
          .stroke(selectedColor, lineWidth: 1)
      )
    case .roundCorner(let corner):
      return AnyView(
        RoundedRectangle(cornerSize: CGSize(width: corner, height: corner))
          .stroke(selectedColor, lineWidth: 1)
      )
    }
  }

  func getClipShape() -> AnyShape {
    switch style {
    case .capsule: return AnyShape(Capsule())
    case .roundCorner(let corner):
      return AnyShape(RoundedRectangle(cornerSize: CGSize(width: corner, height: corner)))
    }
  }
}


struct SegmentedView_Previews: PreviewProvider {
 @State static private var selectedIndex: Int = 0
  static var previews: some View {
    SegmentedView(color: .white, selectedColor: Color("medium_blue"), selectedIndex: $selectedIndex) {
      Text("01")
      Text("02")
      Text("03")
      Text("04")
    }
    .frame(height: 26)
  }
}
