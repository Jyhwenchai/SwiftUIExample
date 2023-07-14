//
//  TransparentBlurView.swift
//  TransparentBlur
//
//  Created by 蔡志文 on 7/12/23.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
  var removeAllFilters: Bool = false

  func makeUIView(context: Context) -> TransparentBlurViewHelper {
    return TransparentBlurViewHelper(removeAllFilters: removeAllFilters)
  }

  func updateUIView(_ uiView: TransparentBlurViewHelper, context: Context) {

  }
}


class TransparentBlurViewHelper: UIVisualEffectView {
  init(removeAllFilters: Bool) {
    super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))

    /// Remove Background View if It's available
    if subviews.indices.contains(1) {
      subviews[1].alpha = 0
    }

    if let backDropLayer = layer.sublayers?.first {
      if removeAllFilters {
        backDropLayer.filters = []
      } else {
        backDropLayer.filters?.removeAll { String(describing: $0) != "gaussianBlur" }
      }
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Disable Trail Change
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

  }
}
