//
//  TagField.swift
//  TagTextField
//
//  Created by 蔡志文 on 11/15/23.
//

import SwiftUI

struct TagField: View {
  @Binding var tags: [Tag]
  var body: some View {
    TagLayout(alignment: .leading) {
      ForEach($tags) { $tag in
        TagView(tag: $tag, allTags: $tags)
          .onChange(of: tag.value) { oldValue, newValue in
            if newValue.last == "," {
              tag.value.removeLast()
              if !tag.value.isEmpty {
                tags.append(.init(value: ""))
              }
            }
          }
      }
    }
    .padding(.vertical, 10)
    .padding(.horizontal, 15)
    .background(.bar, in: .rect(cornerRadius: 12))
    .onAppear(perform: {
      if tags.isEmpty {
        tags.append(.init(value: "", isInitial: true))
      }
    })
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
      if let lastTag = tags.last, !lastTag.value.isEmpty {
        tags.append(.init(value: ""))
      }
    })
  }
}

fileprivate struct TagView: View {
  @Binding var tag: Tag
  @Binding var allTags: [Tag]
  @FocusState private var isFocused: Bool
  @Environment(\.colorScheme) private var colorSchema

  var body: some View {
    BackSpaceListnerTextField(hint: "Tag", text: $tag.value, onBackPressed: {
      if allTags.count > 1 {
        if tag.value.isEmpty {
          allTags.removeAll(where: { $0.id == tag.id })
          if let lastIndex = allTags.indices.last {
            allTags[lastIndex].isInitial = false
          }
        }
      }
    })
      .focused($isFocused)
      .padding(.horizontal, isFocused || tag.value.isEmpty ? 0 : 10)
      .padding(.vertical, 10)
      .background((colorSchema == .dark ? Color.black : Color.white).opacity(isFocused || tag.value.isEmpty ? 0 : 1), in: .rect(cornerRadius: 5))
      .disabled(tag.isInitial)
      .onChange(of: allTags, { oldValue, newValue in
        if newValue.last?.id == tag.id && !(newValue.last?.isInitial ?? false) && !isFocused {
          isFocused = true
        }
      })
      .overlay {
        if tag.isInitial {
          Rectangle()
            .fill(.clear)
            .contentShape(.rect)
            .onTapGesture {
              if allTags.last?.id == tag.id {
                tag.isInitial = false
                isFocused = true
              }
            }
        }
      }
      .onChange(of: isFocused) { _, _ in
        if !isFocused {
          tag.isInitial = true
        }
      }
  }
}

#Preview(body: {
  ContentView()
})


fileprivate struct BackSpaceListnerTextField: UIViewRepresentable {
  func makeCoordinator() -> Coordinator {
    Coordinator(text: $text)
  }
  
  var hint: String = "Tag"
  @Binding var text: String
  var onBackPressed: () -> ()

  func makeUIView(context: Context) -> CustomTextField {
    let textField = CustomTextField()
    textField.delegate = context.coordinator
    textField.onBackPressed = onBackPressed
    textField.placeholder = hint
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .words
    textField.backgroundColor = .clear
    textField.addTarget(context.coordinator, action: #selector(Coordinator.textChange(textField:)), for: .editingChanged)
    return textField
  }

  func updateUIView(_ uiView: CustomTextField, context: Context) {
    uiView.text = text
  }

  func sizeThatFits(_ proposal: ProposedViewSize, uiView: CustomTextField, context: Context) -> CGSize? {
    return uiView.intrinsicContentSize
  }

  class Coordinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    init(text: Binding<String>) {
      self._text = text
    }

    @objc
    func textChange(textField: UITextField) {
      text = textField.text ?? ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
    }
  }
}

fileprivate class CustomTextField: UITextField {
  open var onBackPressed: (() -> ())?
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func deleteBackward() {
    onBackPressed?()
    super.deleteBackward()
  }

  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    return false
  }
}
