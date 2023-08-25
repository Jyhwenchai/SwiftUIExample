//
//  TabStateScrollView.swift
//  ScrollToHideTabBar
//
//  Created by 蔡志文 on 8/11/23.
//

import SwiftUI

struct TabStateScrollView<Content: View>: View {

  var axis: Axis.Set
  var showIndicator: Bool
  @Binding var tabState: Visibility
  var content: Content
  init(axis: Axis.Set, showIndicator: Bool, tabState: Binding<Visibility>, @ViewBuilder content: @escaping () -> Content) {
    self.axis = axis
    self.showIndicator = showIndicator
    self._tabState = tabState
    self.content = content()
  }

  @State private var offsetY: CGFloat = 0
  var body: some View {
    if #available(iOS 17, *) {
      ScrollView(axis) {
        content
      }
      .background {
        CustomGesture {
          handleTabState($0)
        }
      }
      .overlay {
        Text("\(offsetY)")
          .foregroundStyle(.red)
      }
    } else {
      ScrollView(axis, showsIndicators: showIndicator) {
        content
        
      }
      .background {
        CustomGesture {
          handleTabState($0)
        }
      }
    }
  }

  func handleTabState(_ gesture: UIPanGestureRecognizer) {
    offsetY = gesture.translation(in: gesture.view).y
    let velocityY = gesture.velocity(in: gesture.view).y

    if velocityY < 0 {
      if -(velocityY / 5) > 60 && tabState == .visible {
        tabState = .hidden
      }
    } else {
      if (velocityY / 5) > 40 && tabState == .hidden {
        tabState = .visible
      }
    }
  }
}


/// Adding a Custom Simultaneous UIPanGesture to know about what direction did the user is swiping
fileprivate struct CustomGesture: UIViewRepresentable {
  var onChange: (UIPanGestureRecognizer) -> ()
  /// Gesture ID
  private let gestureID = UUID().uuidString
  func makeUIView(context: Context) -> UIView {
    return UIView()
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(onChange: onChange)
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    DispatchQueue.main.async {
      if let superView = uiView.superview?.superview,
         !(superView.gestureRecognizers?.contains(where: { $0.name == gestureID }) ?? false ) {
        let gesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.gestureChange(gesture:)))
        gesture.name = gestureID
        gesture.delegate = context.coordinator
        superView.addGestureRecognizer(gesture)
      }
    }
  }

  class Coordinator: NSObject, UIGestureRecognizerDelegate {
    var onChange: (UIPanGestureRecognizer) -> ()
    init(onChange: @escaping (UIPanGestureRecognizer) -> Void) {
      self.onChange = onChange
    }

    @objc
    func gestureChange(gesture: UIPanGestureRecognizer) {
      onChange(gesture)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
    }
  }
}

#Preview {
  ContentView()
}
