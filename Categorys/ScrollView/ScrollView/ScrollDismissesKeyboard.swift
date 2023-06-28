//
//  ScrollDismissesKeyboard.swift
//  ScrollView
//
//  Created by 蔡志文 on 6/13/23.
//

import SwiftUI

/// `scrollDismissesKeyboard` 定义了滚动视图与键盘的交互行为
/// 当值为 `immediately` 时，当开始滚动视图时键盘会立即移除
/// 当值为 `interactively` 时，当你的手势在列表上滑动到键盘的区域时，此时键盘会沿着手势的方向移除
/// 当值为 `never` 时，键盘会一直存在
/// 该属性适用与 `List`、`TextEditor` 等具有滚动功能的容器
struct ScrollDismissesKeyboard: View {
  enum Mode: Int, Identifiable {
    case automatic
    case immediately
    case interactively
    case never
    var id: Self { self }
    var value: ScrollDismissesKeyboardMode {
      switch self {
      case .automatic: .automatic
      case .immediately: .immediately
      case .interactively: .interactively
      case .never: .never
      }
    }
  }

  @State var mode: Mode = .automatic

  var body: some View {
    VStack {
      Picker("dimissal mode", selection: $mode) {
        Text("automatic").tag(Mode.automatic)
        Text("immediately").tag(Mode.immediately)
        Text("interactively").tag(Mode.interactively)
        Text("never").tag(Mode.never)
      }
      .pickerStyle(.segmented)
      TextField("", text: .constant(""), prompt: Text("placeholder"))
        .textFieldStyle(.roundedBorder)
        .foregroundColor(Color.gray)
        .padding()
        .background(Color.orange.gradient)
        .frame(height: 100)
      ScrollView {
        VStack {
          ForEach(0..<20, id: \.self) { index in
            Text("item: \(index)")
          }
        }
      }
      .scrollDismissesKeyboard(mode.value)
    }
  }
}

#Preview {
  ScrollDismissesKeyboard()
}
