//
//  Settings.swift
//  ITime
//
//  Created by 蔡志文 on 5/26/23.
//

import SwiftUI

struct Settings: View {

  @Environment(\.presentationMode) var presentationMode
  let sections: [[String]] = [
    ["计时器设置", "时间类型设置", "功能模块设置", "便携性设置", "数据相关设置"],
    ["去评分", "关于爱时间", "隐私协议"],
  ]

  var body: some View {
    List {
      ForEach(sections, id: \.self) { rows in
        Section {
          ForEach(rows, id: \.self) { row in
            NavigationLink {

            } label: {
              Text(row)
            }
          }
        } header: {
          if rows.count == 3 {
            Text("关于")
          } else {
            Text("常规")
          }
        }
        .listSectionSeparator(.hidden)
      }
    }
    .listStyle(.plain)
    .toolbarBackground(Color("medium_blue"), for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
    .background(Color("background"))
    .toolbarBackground(.visible, for: .navigationBar)
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image("icon_back22x22")
          Text("设置")
            .foregroundColor(.white)
        }
      }
    }
  }
}

struct Settings_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      Settings()
    }
  }
}
