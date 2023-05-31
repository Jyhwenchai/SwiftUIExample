//
//  Chronoscope.swift
//  ITime
//
//  Created by 蔡志文 on 5/15/23.
//

import SwiftUI

struct Chronoscope: View {
  @Environment(\.presentationMode) var presentationMode

  @State var selectedIndex: Int = 0
  let tags: [String] = [
    "睡觉", "工作", "学习", "吃饭", "活动", "休息", "其他", "在线", "add"
  ]

  @State private var remark: String = ""
  @State private var selectedTag = "睡觉"
  let columnLayout = Array(repeating: GridItem(spacing: 6), count: 4)
  @State private var isPresented = false

  var body: some View {
    ScrollView {
      VStack(spacing: 0) {
        Section {
          HStack(alignment: .center) {
            Text("计时类型")
            Spacer()
            SegmentedView(color: .white, selectedColor: Color("medium_blue"), selectedIndex: $selectedIndex, itemSize: 64) {
              Text("正计时")
              Text("倒计时")
              Text("番茄钟")
            }
            .frame(height: 30)
            .font(.system(size: 13))
          }
          .frame(height: 54)
          .padding(.horizontal, 18)

          Color.gray.opacity(0.6).frame(height: 1 / UIScreen.main.scale)

          HStack {
            Text("计时模式")
            Spacer()
            SegmentedView(color: .white, selectedColor: Color("medium_blue"), selectedIndex: $selectedIndex) {
              Text("专注")
              Text("无")
            }
            .frame(height: 30)
            .font(.system(size: 13))
          }
          .frame(height: 54)
          .padding(.horizontal, 18)

          Color.gray.opacity(0.6).frame(height: 1 / UIScreen.main.scale)

          Button {
            print("开始时间")
          } label: {
            HStack {
              Text("开始时间")
              Spacer()
              Text("选择时间")
                .font(.system(size: 14))
              Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
            }
          }
          .frame(height: 54)
          .padding(.horizontal, 18)
          .foregroundColor(Color.black)

          Color.gray.opacity(0.6).frame(height: 1 / UIScreen.main.scale)

          EditTagList(columnLayout: columnLayout, tags: tags, selectedTag: $selectedTag) {
          }
        }
        .background(Color.white)

        Spacer()
          .frame(height: 10)

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
          isPresented = true
        } label: {
          Text("开始计时")
            .foregroundColor(Color.black)
        }
        .frame(width: 120, height: 44)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
      }
    }
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image("icon_back22x22")
          Text("计时器")
            .foregroundColor(.white)
        }
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {

        }, label: {
          Image("ic_setting_white32x32")
            .resizable()
            .frame(width: 24, height: 24)
        })
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

struct Chronoscope_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      Chronoscope()
    }
  }
}
