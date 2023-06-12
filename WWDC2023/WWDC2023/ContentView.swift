//
//  ContentView.swift
//  WWDC2023
//
//  Created by 蔡志文 on 6/8/23.
//

import SwiftUI

struct ContentView: View {

  @State private var isActive: Bool = false

  var body: some View {
    if isActive {
        Rectangle()
        .fill(Color.yellow.gradient)
        .frame(width: 200, height: 200)
        .transition(RotatingFadeTransition())
    }
    Button("Toggle") {
      withAnimation(Animation(MyLinearAnimation(duration: 1))) {
        isActive.toggle()
      }
    }
  }
}

struct RotatingFadeTransition: Transition {
  func body(content: Content, phase: TransitionPhase) -> some View {
    return content
      .opacity(phase.isIdentity ? 1 : 0)
      .rotationEffect(phase.rotation)
      .clipShape(phase.isIdentity ? AnyShape(Rectangle()) : AnyShape(Circle()))
  }
}
extension TransitionPhase {
  fileprivate var rotation: Angle {
    switch self {
    case .willAppear: return .degrees(30)
    case .identity: return .zero
    case .didDisappear: return .degrees(-30)
    }
  }
}

struct MyLinearAnimation: CustomAnimation {
  var duration: TimeInterval = 1

  func animate<V: VectorArithmetic>(
    value: V, time: TimeInterval, context: inout AnimationContext<V>
  ) -> V? {
    if time > duration { return nil }
    return value.scaled(by: easeOutBounce(time / duration))
  }

  func easeOutBounce(_ x: TimeInterval) -> Double {
    let n1 = 7.5625
    let d1 = 2.75
    var x = x
    if x < 1 / d1 {
      return n1 * x * x
    } else if x < 2 / d1 {
      x -= 1.5 / d1
      return n1 * x * x + 0.75
    } else if x < 2.5 / d1 {
      x -= 2.5 / d1
      return n1 * x * x + 0.9375
    } else {
      x -= 2.625 / d1
      return n1 * x * x + 0.984375
    }
  }
}

#Preview {
  ContentView()
}
