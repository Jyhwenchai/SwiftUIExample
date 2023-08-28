//
//  CustomButton.swift
//  AnimatedButton
//
//  Created by 蔡志文 on 8/28/23.
//

import SwiftUI

struct CustomButton<ButtonContent: View>: View {
  var content: () -> ButtonContent
  var action: () async -> TaskStatus

  @State private var isLoading = false
  @State private var taskStatus: TaskStatus = .idle
  @State private var isFailed = false

  @State private var wiggle = false

  @State private var showPopup = false
  @State private var popupMessage = ""
  var body: some View {
    Button {
      Task {
        isLoading = true
        let taskStatus = await action()
        switch taskStatus {
        case .idle:
          isFailed = false
        case .failed(let string):
          isFailed = true
          popupMessage = string
        case .success:
          isFailed = false
        }
        self.taskStatus = taskStatus
        if isFailed {
          try? await Task.sleep(for: .seconds(0))
          wiggle.toggle()
        }
        try? await Task.sleep(for: .seconds(0.8))
        if isFailed {
          showPopup = true
        }
        self.taskStatus = .idle
//        if isFailed {
          isLoading = false
//        }
      }
    } label: {
      content()
        .padding(.horizontal, 30)
        .padding(.vertical, 12)
        .opacity(isLoading ? 0 : 1)
        .lineLimit(1)
        .frame(width: isLoading ? 50 : nil, height: isLoading ? 50 : nil)
        .background(Color(taskStatus == .idle ? .white : taskStatus == .success ? .green : .red).shadow(.drop(color: .black.opacity(0.15), radius: 6)), in: .capsule)
        .overlay {
          if isLoading && taskStatus == .idle {
            ProgressView()
          }
        }
        .overlay {
          if taskStatus != .idle {
            Image(systemName: isFailed ? "exclamationmark" : "checkmark")
              .font(.title2.bold())
              .foregroundStyle(.white)
          }
        }
        .wiggle(wiggle)
    }
    .disabled(isLoading)
    .popover(isPresented: $showPopup, content: {
      Text(popupMessage)
        .font(.caption)
        .foregroundStyle(.gray)
        .padding(.horizontal, 20)
        .presentationCompactAdaptation(.popover)
    })
    .animation(.snappy, value: isLoading)
    .animation(.snappy, value: taskStatus)
  }
}

#Preview {
  ContentView()
}

enum TaskStatus: Equatable {
  case idle
  case failed(String)
  case success
}

extension View {
  @ViewBuilder
  func wiggle(_ animate: Bool) -> some View {
    self
      .keyframeAnimator(initialValue: CGFloat.zero, trigger: animate) { view, value in
        view
          .offset(x: value)
      } keyframes: { _ in
        KeyframeTrack {
          CubicKeyframe(0, duration: 0.1)
          CubicKeyframe(-5, duration: 0.1)
          CubicKeyframe(5, duration: 0.1)
          CubicKeyframe(-5, duration: 0.1)
          CubicKeyframe(5, duration: 0.1)
          CubicKeyframe(-5, duration: 0.1)
          CubicKeyframe(5, duration: 0.1)
          CubicKeyframe(0, duration: 0.1)
        }
      }

  }
}
