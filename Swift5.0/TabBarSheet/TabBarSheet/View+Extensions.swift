//
//  View+Extensions.swift
//  TabBarSheet
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

extension View {
  @ViewBuilder
  func hideNativeTabBar() -> some View {
    self
      .toolbar(.hidden, for: .tabBar)
  }
}

extension TabView {
  @ViewBuilder
  func tabSheet<SheetContent: View>(initialHeight: CGFloat = 100, sheetCornerRadius: CGFloat = 15, @ViewBuilder content: @escaping () -> SheetContent) -> some View {
    self
      .modifier(BottomSheetModifier(initialHeight: initialHeight, sheetCornerRadius: sheetCornerRadius, sheetView: content()))
  }
}

fileprivate struct BottomSheetModifier<SheetContent: View>: ViewModifier {
  var initialHeight: CGFloat
  var sheetCornerRadius: CGFloat
  var sheetView: SheetContent

  @State private var showSheet: Bool = true

  func body(content: Content) -> some View {
    content
      .sheet(isPresented: $showSheet) {
        sheetView
          .presentationDetents([.height(initialHeight), .medium, .fraction(0.99)])
          .presentationCornerRadius(sheetCornerRadius)
          .presentationBackgroundInteraction(.enabled(upThrough: .medium))
          .presentationBackground(.regularMaterial)
          .interactiveDismissDisabled()
      }
  }
}
