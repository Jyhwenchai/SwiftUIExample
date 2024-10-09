//
//  ContentView.swift
//  GestureRepresentable
//
//  Created by 蔡志文 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
  @State private var offsetY: CGFloat = 0
  var body: some View {
    VStack {
      Text("Translation Y: \(offsetY)")
        .font(.title2.bold())
      ScrollView {
        VStack(spacing: 10) {
          ForEach(1...50, id: \.self) { _ in
            RoundedRectangle(cornerRadius: 15)
              .fill(.red.gradient)
              .frame(height: 45)
          }
        }
        .padding(15)
      }
      .gesture(SimultaneousGesture(offset: $offsetY))
    }
  }
}

#Preview {
  ContentView()
}

struct SimultaneousGesture: UIGestureRecognizerRepresentable {
  @Binding var offset: CGFloat
  func makeCoordinator(converter: CoordinateSpaceConverter) -> Coordinator {
    return Coordinator()
  }

  func makeUIGestureRecognizer(context: Context) -> UIPanGestureRecognizer {
    let gesture = UIPanGestureRecognizer()
    gesture.delegate = context.coordinator
    return gesture
  }

  func updateUIGestureRecognizer(_ recognizer: UIPanGestureRecognizer, context: Context) {
  }

  func handleUIGestureRecognizerAction(_ recognizer: UIPanGestureRecognizer, context: Context) {
    let translation = recognizer.translation(in: recognizer.view)
    offset = translation.y
  }

  class Coordinator: NSObject, UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
      return true
    }
  }
}
