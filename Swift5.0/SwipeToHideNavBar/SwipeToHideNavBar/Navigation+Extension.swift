//
//  Navigation+Extension.swift
//  SwipeToHideNavBar
//
//  Created by 蔡志文 on 9/26/23.
//

import SwiftUI

extension View {
  @ViewBuilder
  func hideNavBarOnSwipe(_ isHidden: Bool) -> some View {
    self
      .modifier(NavBarModifier(isHidden: isHidden))
  }
}

private struct NavBarModifier: ViewModifier {
  var isHidden: Bool
  @State private var isNavBarHidden: Bool?
  func body(content: Content) -> some View {
    content
      .onChange(of: isHidden, initial: true) { oldValue, newValue in
        isNavBarHidden = newValue
      }
      .onDisappear(perform: {
        isNavBarHidden = nil
      })
      .background {
        NavigationControllerExtractor(isHidden: isNavBarHidden)
      }
  }
}

private struct NavigationControllerExtractor: UIViewRepresentable {
  var isHidden: Bool?
  func makeUIView(context: Context) -> UIView {
    UIView()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
      if let hostView = uiView.superview?.superview, let parentController = hostView.parentController {
        if let isHidden {
          parentController.navigationController?.hidesBarsOnSwipe = isHidden
        }
      }
    }
  }
}

extension UIView {
  var parentController: UIViewController? {
    sequence(first: self) { view in
      view.next
    }
    .first { responder in
      return responder is UIViewController
    } as? UIViewController
  }
}
