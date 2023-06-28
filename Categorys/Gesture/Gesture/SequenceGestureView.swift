//
//  SequenceGestureView.swift
//  Gesture
//
//  Created by 蔡志文 on 6/27/23.
//

import SwiftUI
/// 组合手势，`SequenceGesture` 要求第二个手势必须在第一个手势被识别后才能被识别
/// 下面示例中当 `LongPressGesture` 手势被识别之后才会识别 `DragGesture`
struct SequenceGestureView: View {
  enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)

    var translation: CGSize {
      switch self {
      case .inactive, .pressing:
        return .zero
      case .dragging(let translation):
        return translation
      }
    }

    var isActive: Bool {
      switch self {
      case .inactive:
        return false
      case .pressing, .dragging:
        return true
      }
    }

    var isDragging: Bool {
      switch self {
      case .inactive, .pressing:
        return false
      case .dragging:
        return true
      }
    }
  }

  @GestureState private var dragState = DragState.inactive
  @State private var viewState = CGSize.zero

  var body: some View {
    let minimumLongPressDuration = 0.5
    let longPressDrag = LongPressGesture(minimumDuration: minimumLongPressDuration)
      .sequenced(before: DragGesture())
      .updating($dragState) { value, state, transaction in
        switch value {
          // Long press begins.
        case .first(true):
          state = .pressing
          // Long press confirmed, dragging may begin.
        case .second(true, let drag):
          state = .dragging(translation: drag?.translation ?? .zero)
          // Dragging ended or the long press cancelled.
        default:
          state = .inactive
        }
      }
      .onEnded { value in
        guard case .second(true, let drag?) = value else { return }
        // 保存视图最后的位置
        self.viewState.width += drag.translation.width
        self.viewState.height += drag.translation.height
      }
    return Circle()
      .fill(Color.blue)
      .overlay(dragState.isDragging ? Circle().stroke(Color.white, lineWidth: 2) : nil)
      .frame(width: 100, height: 100, alignment: .center)
      .offset(
        x: viewState.width + dragState.translation.width,
        y: viewState.height + dragState.translation.height
      )
      .shadow(radius: dragState.isActive ? 8 : 0)
      .animation(.linear, value: minimumLongPressDuration)
      .gesture(longPressDrag)
  }
}

#Preview {
  SequenceGestureView()
}
