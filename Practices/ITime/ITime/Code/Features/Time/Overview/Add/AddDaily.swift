//
//  AddDaily.swift
//  ITime
//
//  Created by 蔡志文 on 5/12/23.
//

import SwiftUI

enum DailyTime: String, CaseIterable, Identifiable {
  case today = "今天"
  case yestoday = "昨天"
  var id: Self { self }
}

struct AddDaily: View {

  @Environment(\.presentationMode) var presentationMode
  @State private var selectedDate: Date = Date()

  let tags: [String] = [
    "睡觉", "工作", "学习", "吃饭", "活动", "休息", "其他", "在线", "add"
  ]

  @State private var remark: String = ""
  @State private var selectedTag = "睡觉"
  let columnLayout = Array(repeating: GridItem(spacing: 6), count: 4)

  var body: some View {
    GeometryReader { proxy in
      VStack {
        Text("14小时42分钟")
          .frame(height: 50)
          .foregroundColor(Color("medium_blue"))
          .bold()
        ZStack {
          Color.white
          GeometryReader { proxy in
            let width = proxy.frame(in: .global).size.width * 0.5
            let pickerWidth = max(0, width - 50)
            HStack(spacing: 0) {
              DurationPicker(width: pickerWidth)
              DurationPicker(width: pickerWidth)
            }
            .padding(.vertical)
          }
        }
        .frame(height: 160)

        Spacer()
          .frame(height: 10)
        EditTagList(columnLayout: columnLayout, tags: tags, selectedTag: $selectedTag) {
          print("add action")
        }
        .background(Color.white)

        HStack {
          Text("备注")
          TextField(text: $remark) {
            Text("请输入备注")
          }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white)

        Spacer()
          .frame(height: 20)
        Button {

        } label: {
          Text("完成")
            .foregroundColor(Color.white)
        }
        .frame(width: 120, height: 44)
        .background(Color("medium_blue"))
        .cornerRadius(22)

        Spacer()
      }
    }
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image("icon_back22x22")
          Text("添加")
            .foregroundColor(.white)
        }
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        HStack {
          Button("日历") {
          }
          Button("完成") {
          }
        }
        .foregroundColor(Color.white)
        .font(.subheadline)
      }
    }
    .toolbarBackground(Color("medium_blue"), for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color("background"))
    .toolbarBackground(.visible, for: .navigationBar)
  }
}

struct AddDaily_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      AddDaily()
    }
  }
}

