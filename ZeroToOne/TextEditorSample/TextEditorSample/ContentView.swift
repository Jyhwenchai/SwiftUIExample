//
//  ContentView.swift
//  TextEditorSample
//
//  Created by 蔡志文 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
  @State private var content: String = "A text editor view allows you to display and edit multiline, scrollable text in your app’s user interface."
  @State private var selection: TextSelection?
  @State private var email: String = "cai5301@qq.com"
  var selectionString: String {
    guard let selection else { return "" }
    let selectionIndices = selection.indices
    switch selectionIndices {
    case .selection(let range):
      if range.isEmpty { return "" }
      let subString = content[range]
      print("selection text: \(subString)")
      return "\(subString)"
    case .multiSelection(let rangeSet):
      if rangeSet.isEmpty { return "" }
      let subString = content[rangeSet]
      print("multi selection text: \(subString)")
      return "\(subString)"
    @unknown default: break
    }
    return ""
  }

  var body: some View {
    Form {
      HStack {
        Text("content: ")
        TextEditor(text: $content)
          .frame(height: 100)
      }
      VStack {
        HStack {
          Text("content: ")
          TextEditor(text: $content, selection: $selection)
            .frame(height: 100)
            // 设置光标选中的方向，预览无法使用, 触发奔溃
//            .textSelectionAffinity(.upstream)
            .textCase(.uppercase) // 无效
            .onSubmit {
              print(content)
            }
        }
        Text("Selection Text: ")
          .frame(maxWidth: .infinity, alignment: .leading)
          .foregroundStyle(Color.red)
        Text(selectionString)
          .frame(maxWidth: .infinity, alignment: .leading)
        VStack {
          TextEditor(text: $email)
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: .leading)
            .textContentType(.emailAddress)
          CustomTextEditor(text: $content, placeholder: "hello, world")
        }
      }
    }
  }
}

#Preview {
  ContentView()
}

struct CustomTextEditor: View {
  @Binding var text: String
  let placeholder: String

  var body: some View {
    ZStack(alignment: .topLeading) {
      if text.isEmpty {
        Text(placeholder)
          .foregroundColor(Color(.placeholderText))
          .padding(.horizontal, 5)
          .padding(.vertical, 8)
      }

      TextEditor(text: $text)
        .frame(minHeight: 100)
        .scrollContentBackground(.hidden)
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 8)
        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
    )
  }
}
