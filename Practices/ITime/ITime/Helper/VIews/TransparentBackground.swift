//
//  TransparentBackground.swift
//  ITime
//
//  Created by 蔡志文 on 5/19/23.
//

import SwiftUI

struct TransparentBackground: UIViewRepresentable {
  private class BackgroundRemovalView: UIView {
    override func didMoveToWindow() {
      super.didMoveToWindow()
      superview?.superview?.backgroundColor = .clear
    }

  }

  func makeUIView(context: Context) -> UIView {
    return BackgroundRemovalView()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }
}
