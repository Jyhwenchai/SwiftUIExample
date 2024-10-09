//
//  TagLayout.swift
//  MealPlanner
//
//  Created by 蔡志文 on 1/15/24.
//

import SwiftUI

struct TagLayout: Layout {

  var alignment: Alignment = .center
  var spacing: CGFloat = 10

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
    let maxWidth = proposal.width ?? 0.0
    var height: CGFloat = 0.0

    let rows = generateRows(maxWidth, proposal, subviews)

    for (index, row) in rows.enumerated() {
      if index == rows.count - 1 {
        height += row.maxHeight(proposal)
      } else {
        height += row.maxHeight(proposal) + spacing
      }
    }

    return .init(width: maxWidth, height: height)
  }

  func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
    var origin = bounds.origin
    let maxWidth = bounds.width
    let rows = generateRows(maxWidth, proposal, subviews)
    print("bounds: \(bounds)")

    for row in rows {
      let leading: CGFloat = bounds.maxX - maxWidth // |____[++++++++____]|
      let trailing = bounds.maxX - (row.reduce(CGFloat.zero, { partialResult, view in // |[+++++++]_____|
        let width = view.sizeThatFits(proposal).width
        if view == row.last {
          return partialResult + width
        } else {
          return partialResult + width + spacing
        }
      }))

      let center = (trailing + leading) / 2.0

      origin.x = (alignment == .leading ? leading : alignment == .trailing ? trailing : center)

      for view in row {
        let viewSize = view.sizeThatFits(proposal)
        view.place(at: origin, proposal: proposal)
        origin.x += (viewSize.width + spacing)
      }

      origin.y += (row.maxHeight(proposal) + spacing)
    }
  }

  func generateRows(_ maxWidth: CGFloat, _ proposal: ProposedViewSize, _ subviews: Subviews) -> [[LayoutSubviews.Element]] {
    var row: [LayoutSubviews.Element] = []
    var rows: [[LayoutSubviews.Element]] = []

    var origin = CGRect.zero.origin

    for subview in subviews {
      let viewSize = subview.sizeThatFits(proposal)

      if origin.x + viewSize.width + spacing > maxWidth {
        rows.append(row)
        row.removeAll()
        origin.x = 0
        row.append(subview)
        origin.x += (viewSize.width + spacing)
      } else {
        row.append(subview)
        origin.x += (viewSize.width + spacing)
      }
    }

    if !row.isEmpty {
      rows.append(row)
    }

    return rows
  }
}

extension [LayoutSubviews.Element] {
  func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
    return self.compactMap { view in
      return view.sizeThatFits(proposal).height
    }.max() ?? 0
  }
}
