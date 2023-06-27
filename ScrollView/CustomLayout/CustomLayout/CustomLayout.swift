//
//  CustomLayout.swift
//  CustomLayout
//
//  Created by 蔡志文 on 6/21/23.
//

import SwiftUI
/// 具体示例见
/// ![code](https://developer.apple.com/documentation/swiftui/composing_custom_layouts_with_swiftui)
/// ![video](https://developer.apple.com/videos/play/wwdc2022/10056/)
struct Pet: Identifiable, Equatable {
  let type: String
  var votes: Int = 0
  var id: String { type }

  static var exampleData: [Pet] = [
    Pet(type: "Cat", votes: 25),
    Pet(type: "Goldfish", votes: 9),
    Pet(type: "Dog", votes: 16)
  ]
}

struct Leaderboard: View {
  @State var pets: [Pet]
  var totalVotes: Int

  var body: some View {
    MyEqualWidthHStack {
      ForEach($pets) { $pet in
        Button {
          pet.votes += 1
        } label: {
          Text(pet.type)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
      }
    }
  }
}

struct CustomLayout: View {
  var body: some View {
    Leaderboard(pets: Pet.exampleData, totalVotes: 50)
      .border(Color.black, width: 1)
  }
}

struct MyEqualWidthHStack: Layout {
  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Void
  ) -> CGSize {
    // Return a container size.
    guard !subviews.isEmpty else { return .zero }

    let maxSize = maxSize(subviews: subviews)
    let spacing = spacing(subviews: subviews)
    let totalSpacing = spacing.reduce(0) { $0 + $1 }

    return CGSize(
      width: maxSize.width * CGFloat(subviews.count) + totalSpacing,
      height: maxSize.height + 50)
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Void
  ) {
    // Place child views.
    guard !subviews.isEmpty else { return }

    let maxSize = maxSize(subviews: subviews)
    let spacing = spacing(subviews: subviews)

    let placementProposal = ProposedViewSize(width: maxSize.width, height: maxSize.height)
    var x = bounds.minX + maxSize.width / 2

    for index in subviews.indices {
      subviews[index].place(
        at: CGPoint(x: x, y: bounds.midY),
        anchor: .center,
        proposal: placementProposal)
      x += maxSize.width + spacing[index]
    }
  }

  private func maxSize(subviews: Subviews) -> CGSize {
    let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
    let maxSize: CGSize = subviewSizes.reduce(.zero) { currentMax, subviewSize in
      CGSize(
        width: max(currentMax.width, subviewSize.width),
        height: max(currentMax.height, subviewSize.height))
    }

    return maxSize
  }

  private func spacing(subviews: Subviews) -> [CGFloat] {
    subviews.indices.map { index in
      guard index < subviews.count - 1 else { return 0 }
      return subviews[index].spacing.distance(
        to: subviews[index + 1].spacing,
        along: .horizontal)
    }
  }

  func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
    print(bounds)
    return bounds.width / 2
  }

  func explicitAlignment(of guide: VerticalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
    bounds.height / 2
  }
}

#Preview {
    CustomLayout()
}
