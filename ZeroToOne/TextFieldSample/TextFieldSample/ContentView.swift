//
//  ContentView.swift
//  TextFieldSample
//
//  Created by 蔡志文 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
  @State private var username: String = ""
  @State private var password: String = ""
  @State private var age: String = ""
  @State private var birthday: Date = Date()
  @State private var money: Double = 0
  @State private var moneyString: String = ""

  /// focus
  @FocusState private var usernameFocusted: Bool
  var dateFormat: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }

  var numberFormat: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    formatter.roundingMode = .down
    return formatter
  }

  var body: some View {
    Form {
      Section("基本使用") {
        TextField("username", text: $username)
        TextField("username", text: $username, axis: .vertical)
      }

      Section("placeholder") {
        TextField(
          "username",
          text: $username,
          /// placeholder style
          prompt:
            Text("prompt username")
            .fontWeight(.bold)
            .foregroundStyle(Color.mint)
        )
      }

      Section("格式化") {
        HStack {
          TextField("birthday", value: $birthday, formatter: dateFormat)
          DatePicker("", selection: $birthday, displayedComponents: [.date])
        }
        HStack {
          Label("限制输入:", image: "")
            .labelStyle(.titleOnly)
          TextField("money", value: $money, formatter: numberFormat)
        }
      }

      Section("Event") {
        HStack {
          Label("onChnage 限制输入:", image: "")
            .labelStyle(.titleOnly)
          TextField("money", value: $money, formatter: numberFormat)
            .onChange(of: money, initial: false) {
              let desc = numberFormat.string(from: NSNumber(value: money)) ?? "0.00"
              let number = numberFormat.number(from: desc)?.doubleValue ?? 0
              money = number
            }
        }
        HStack {
          Text("submit: ")
          TextField("age", text: $age)
            .onSubmit {
              print("submit: \(age)")
            }
        }
      }

      Section("Focus") {
        HStack {
          TextField("username", text: $username)
            .focused($usernameFocusted)
          Button("focused") {
            usernameFocusted = true
          }
          .buttonStyle(.bordered)
        }
        TextField("password", text: $password)
        TextField("age", text: $age)
      }

      Section("Style") {
        TextField("username", text: $username)
          .textFieldStyle(.automatic)
        TextField("username", text: $username)
          .textFieldStyle(.plain)
        TextField("username", text: $username)
          .textFieldStyle(.roundedBorder)
      }

      Section("Style") {
        HStack {
          Text("Auto Correction")
          TextField("username", text: $username)
            // 自动修正单词
            .autocorrectionDisabled(true)
            // 输入内容的格式处理
            .textInputAutocapitalization(.words)
            // 键盘类型
            .keyboardType(.asciiCapableNumberPad)
            .tint(Color.mint)
            .foregroundStyle(Color.red)
            .font(.title3)
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
