//
//  GridColumnAlignment.swift
//  LayoutFundamentals
//
//  Created by 蔡志文 on 6/15/23.
//

import SwiftUI

struct GridRowAlignment: View {
  @State private var alignment: AlignmentStyle = .center
  @State private var rowAlignment: RowAlignment = .center

  private enum AlignmentStyle: String, Identifiable, CaseIterable {
    case topLeading
    case top
    case topTrailing
    case trailing
    case leading
    case center
    case bottom
    case bottomLeading
    case bottomTrailing
    var id: Self { self }

    var value: Alignment {
      switch self {
      case .leading: .leading
      case .center: .center
      case .trailing: .trailing
      case .top: .top
      case .topLeading: .topLeading
      case .topTrailing: .topTrailing
      case .bottomLeading: .bottomLeading
      case .bottomTrailing: .bottomTrailing
      default: .center
      }
    }
  }

  private enum RowAlignment: String, Identifiable, CaseIterable {
    case top
    case center
    case bottom
    case firstTextBaseline
    case lastTextBaseline
    var id: Self { self }

    var value: VerticalAlignment {
      switch self {
      case .top: .top
      case .center: .center
      case .bottom: .bottom
      case .firstTextBaseline: .firstTextBaseline
      case .lastTextBaseline: .lastTextBaseline
      }
    }
  }

  private struct Item: Identifiable {
    let id = UUID()
    let size: CGSize
    let color: Color
  }

  private var itemGroup: [[Item]] = []
  init() {
    (0..<4).forEach { _ in
      var items: [Item] = []
      let color = Color.random
      (0..<4).forEach { _ in
        let size = CGSize(width: Double.random(in: 30..<80), height: Double.random(in: 30..<80))
        items.append(Item(size: size, color: color))
      }
      itemGroup.append(items)
    }
  }

  var body: some View {
    VStack {
      Picker("Alignment", selection: $alignment) {
        ForEach(AlignmentStyle.allCases, id: \.self) { item in
          Text(item.rawValue).tag(item)
        }
      }
      .pickerStyle(.wheel)

      Picker("RowAlignment", selection: $rowAlignment) {
        ForEach(RowAlignment.allCases, id: \.self) { item in
          Text(item.rawValue).tag(item)
        }
      }
      .pickerStyle(.segmented)


      Grid(alignment: alignment.value, horizontalSpacing: 10, verticalSpacing: 10) {
        ForEach(0..<4, id: \.self) { i in
          let items = itemGroup[i]
          GridRow(alignment: rowAlignment.value) {
            ForEach(0..<4) { j in
              let item = items[j]
              RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .fill(item.color)
                .brightness(Double(j) / 10.0)
                .frame(width: item.size.width, height: item.size.height)
            }
          }
        }
      }
      .border(Color.black, width: 1)
    }
  }
}

#Preview {
  GridRowAlignment()
}
