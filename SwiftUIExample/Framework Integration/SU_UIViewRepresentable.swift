//
//  SU_UIViewRepresentable.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/2.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {

  @Binding var text: String
  @Binding var textStyle: UIFont.TextStyle

  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()

    textView.font = UIFont.preferredFont(forTextStyle: textStyle)
    textView.autocapitalizationType = .sentences
    textView.isSelectable = true
    textView.delegate = context.coordinator
    textView.isUserInteractionEnabled = true

    return textView
  }

  // 交互使 SwiftUI 中的修改同步到 UITextView 对应的属性
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
    uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
  }

  // 交互使 UITextView 的修改可以同步到 SwiftUI 中的对应的属性
  // 这里使 UITextView 改变时对应的 SU_UIViewRepresentable 中的 `message` 可以保持同步
  func makeCoordinator() -> Coordinator {
    Coordinator($text)
  }

  class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>

    init(_ text: Binding<String>) {
      self.text = text
    }

    func textViewDidChange(_ textView: UITextView) {
      self.text.wrappedValue = textView.text
    }
  }
}

struct SU_UIViewRepresentable: View {
  @State private var message = ""
  @State private var textStyle = UIFont.TextStyle.body
  var body: some View {
    VStack {
      Text("input: \(message)")
      TextView(text: $message, textStyle: $textStyle)
        .frame(width: 300, height: 200, alignment: .center)
        .border(Color.orange, width: 2)
      Button("change input") {
        message = "hello, world"
      }
    }
  }
}

struct SU_UIViewRepresentable_Previews: PreviewProvider {
  static var previews: some View {
    SU_UIViewRepresentable()
  }
}
