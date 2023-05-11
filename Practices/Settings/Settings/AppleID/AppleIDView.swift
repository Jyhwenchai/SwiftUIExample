//
//  AppleIDView.swift
//  Settings
//
//  Created by 蔡志文 on 5/5/23.
//

import SwiftUI

struct AppleIDView: View {

  @Environment(\.presentationMode) var presentationMode

  @State var email: String = ""

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          Spacer(minLength: 100)
          Text("Apple ID")
            .font(.largeTitle)
            .bold()
          Spacer(minLength: 12)
          Text("通过 Apple ID 登录以使用 iCloud、\n App Store 和其他 Apple 服务。")
            .multilineTextAlignment(.center)
          HStack {
            HStack {
              Text("Apple ID")
                .font(.headline)
                .bold()
              Spacer(minLength: 20)
              TextField(text: $email) { Text("电子邮件") }
                .font(.subheadline)
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(Color(uiColor: UIColor(red: 242.0 / 255, green: 242.0 / 255, blue: 247.0 / 255, alpha: 1)))
            .cornerRadius(8)
          }
          .padding(EdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18))
          Button("忘记密码或没有 Apple ID？") {
          }
          VStack {
            Image(systemName: "figure.stand.line.dotted.figure.stand")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 40, height: 40, alignment: .center)
              .foregroundColor(.blue)

            let text = """
            您的 Apple ID 信息用于在你登录时启用 Apple 服务，其中包括
            iCloud 云备份，该服务可自动备份设备上的数据，以防你需要更
            换恢复的设备。你的设备序列号可能会被用于检查是否符合服务
            的使用资格。了解数据的管理方式...
            """
            var content: AttributedString {
              var attributedString = AttributedString(text)
              attributedString.foregroundColor = .gray
              attributedString.font = .caption2
              let range = attributedString.range(of: "了解数据的管理方式...")!
              attributedString[range].foregroundColor = .blue
              return attributedString
            }

            Button {
            } label: {
              Text(content)
                .multilineTextAlignment(.center)
            }
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("取消") {
            presentationMode.wrappedValue.dismiss()
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("下一步") {
          }
          .disabled(true)
        }
      }
      .toolbarBackground(
        Color.white.opacity(0.1),
        for: .navigationBar
      )
    }
  }
}

struct AppleIDView_Previews: PreviewProvider {
  static var previews: some View {
    AppleIDView()
  }
}

struct NavigationBarColor: ViewModifier {
    init(backgroundColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}
