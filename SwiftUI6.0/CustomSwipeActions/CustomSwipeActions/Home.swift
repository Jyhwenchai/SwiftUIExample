//
//  Home.swift
//  CustomSwipeActions
//
//  Created by 蔡志文 on 7/30/24.
//

import SwiftUI

struct Home: View {
  @State private var colors: [Color] = [.black, .yellow, .purple, .brown]
    var body: some View {
      ScrollView(.vertical) {
        LazyVStack(spacing: 10) {
          ForEach(colors, id: \.self) { color in
            SwipeAction(cornerRadius: 15, direction: color == .black ? .trailing : .leading) {
              CardView(color)
            } actions: {
              Action(tint: .blue, icon: "star.fill", isEnabled: color == .black) {

              }

              Action(tint: .red, icon: "trash.fill") {
                withAnimation(.easeInOut(duration: 0.2)) {
                  colors.removeAll(where: { $0 == color })
                }
              }
            }
          }
        }
        .padding(15)
      }
      .scrollIndicators(.hidden)
    }

  @ViewBuilder
  func CardView(_ color: Color) -> some View {
    HStack(spacing: 12) {
      Circle()
        .frame(width: 50, height: 50)

      VStack(alignment: .leading, spacing: 6, content: {
        RoundedRectangle(cornerRadius: 5)
          .frame(width: 80, height: 5)
        RoundedRectangle(cornerRadius: 5)
          .frame(width: 60, height: 5)
      })
      Spacer(minLength: 0)
    }
    .foregroundStyle(.white.opacity(0.6))
    .padding(.horizontal, 15)
    .padding(.vertical, 10)
    .background(color.gradient, in: RoundedRectangle(cornerRadius: 15))
  }
}

#Preview {
    Home()
}

struct SwipeAction<Content: View>: View {
  var cornerRadius: CGFloat = 0
  var direction: SwipeDirection = .trailing
  @ViewBuilder var content: Content
  @ActionBuilder var actions: [Action]
  @Environment(\.colorScheme) private var schema
  let viewID = UUID()
  /// 动画启用时禁止交互
  @State private var isEnabled: Bool = true
  @State private var scrollOffset: CGFloat = .zero
  var body: some View {
    ScrollViewReader { scrollProxy in
      ScrollView(.horizontal) {
        LazyHStack(spacing: 0) {
          content
            .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
            .containerRelativeFrame(.horizontal)
//            .background(schema == .dark ? .black : .white)
            .background {
              /// 修正背景颜色
              if let firstAction = filteredActions.first {
                Rectangle()
                  .fill(firstAction.tint)
                  .opacity(scrollOffset == .zero ? 0 : 1)
              }
            }
            .id(viewID)
          // 屏蔽内容动画
            .transition(.identity)
            .overlay {
              GeometryReader {
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                Color.clear
                  .preference(key: OffsetKey.self, value: minX)
                  .onPreferenceChange(OffsetKey.self, perform: { value in
                    scrollOffset = value
                  })
              }
            }

          ActionButtons {
            withAnimation(.snappy) {
              scrollProxy.scrollTo(viewID, anchor: direction == .trailing ? .topLeading : .topTrailing)
            }
          }
          .opacity(scrollOffset == .zero ? 0 : 1)
        }
        .scrollTargetLayout()
        .visualEffect { content, geometryProxy in
          content
            .offset(x: scrollOffset(geometryProxy))
        }
      }
      .scrollIndicators(.hidden)
      .scrollTargetBehavior(.viewAligned)
      .background {
        if let lastAction = filteredActions.last {
          Rectangle()
            .fill(lastAction.tint)
            .opacity(scrollOffset == .zero ? 0 : 1)
        }
      }
      .clipShape(.rect(cornerRadius: cornerRadius))
      .rotationEffect(.init(degrees: direction == .leading ? 180 : 0))
    }
    .allowsHitTesting(isEnabled)
    /// 修复删除动画闪烁问题
    .transition(CustomTransition())
  }

  @ViewBuilder
  func ActionButtons(resetPosition: @escaping () -> ()) -> some View {
    Rectangle()
      .fill(.clear)
      .frame(width: CGFloat(filteredActions.count) * 100)
      .overlay(alignment: direction.alignment) {
        HStack(spacing: 0) {
          ForEach(filteredActions) { button in
            Button(action: {
              Task {
                isEnabled = false
                resetPosition()
                try? await Task.sleep(for: .seconds(0.25))
                button.action()
                try? await Task.sleep(for: .seconds(0.1))
                isEnabled = true
              }
            }, label: {
              Image(systemName: button.icon)
                .font(button.iconFont)
                .foregroundStyle(button.iconTint)
                .frame(width: 100)
                .frame(maxHeight: .infinity)
                .contentShape(.rect)
            })
            .buttonStyle(.plain)
            .background(button.tint)
            .rotationEffect(.init(degrees: direction == .leading ? -180 : 0))
          }
        }
      }
  }

  func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
    let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
//    return direction == .trailing ? (minX > 0 ? -minX : 0) : (minX < 0 ? -minX : 0)
    return (minX > 0 ? -minX : 0)
  }

  var filteredActions: [Action] {
    return actions.filter { $0.isEnabled }
  }
}

struct Action: Identifiable {
  private(set) var id: UUID = .init()
  var tint: Color
  var icon: String
  var iconFont: Font = .title3
  var iconTint: Color = .white
  var isEnabled: Bool = true
  var action: () -> ()
}

enum SwipeDirection {
  case leading
  case trailing

  var alignment: Alignment {
    switch self {
    case .leading:
      return .leading
    case .trailing:
      return .trailing
    }
  }
}

@resultBuilder
struct ActionBuilder {
  static func buildBlock(_ components: Action...) -> [Action] {
    return components
  }
}

struct CustomTransition: Transition {
  func body(content: Content, phase: TransitionPhase) -> some View {
    content
      .mask {
        GeometryReader {
          let size = $0.size
          Rectangle()
            .offset(y: phase == .identity ? 0 : -size.height)
        }
        .containerRelativeFrame(.horizontal)
      }
  }
}

struct OffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
