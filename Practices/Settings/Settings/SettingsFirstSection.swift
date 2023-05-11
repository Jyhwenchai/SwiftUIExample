//
//  SettingsFirstSection.swift
//  Settings
//
//  Created by 蔡志文 on 5/4/23.
//

import SwiftUI

struct SettingsFirstSection: View {
  @State var isPresented = false
  var body: some View {
    Section {
      Button {
        isPresented.toggle()
      } label: {
        HStack(spacing: 12) {
          Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.gray.opacity(0.5))
          VStack(alignment: .leading) {
            Text("登录iPhone")
              .foregroundColor(.blue)
              .font(.callout)
              .bold()
            Text("设置iCloud、App Store 等。")
              .font(.caption)
              .bold()
              .foregroundColor(.black)
          }
        }
      }
      .sheet(isPresented: $isPresented) {
        AppleIDView()
      }

      NavigationLink {
        EmptyView()
      } label: {
        HStack {
          Text("VPN")
            .font(.footnote)
            .foregroundColor(.white)
            .padding(.vertical, 6)
            .padding(.horizontal, 2)
            .background(Color.blue)
            .cornerRadius(5)
          Text("VPN")
          Spacer()
          Text("未连接")
            .foregroundColor(Color.gray)
        }
      }
    }
  }
}

struct SettingsFirstSection_Previews: PreviewProvider {
  static var previews: some View {
    SettingsFirstSection()
  }
}
