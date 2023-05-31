//
//  EditTagList.swift
//  ITime
//
//  Created by 蔡志文 on 5/16/23.
//

import SwiftUI

struct EditTagList: View {
  let columnLayout: [GridItem]
  let tags: [String]
  @Binding var selectedTag: String
  let addAction: () -> Void

  let itemWidth: CGFloat

  init(columnLayout: [GridItem], tags: [String], selectedTag: Binding<String>, addAction: @escaping () -> Void) {
    self.columnLayout = columnLayout
    self.tags = tags
    self._selectedTag = selectedTag
    self.addAction = addAction
    self.itemWidth = (UIScreen.main.bounds.size.width - 58) / Double(columnLayout.count)
  }

  var body: some View {
    VStack {
      LazyVGrid(columns: columnLayout) {
        ForEach(tags, id: \.self) { tag in
          Button {
            if tag == "add" {
              addAction()
            } else {
              selectedTag = tag
            }
          } label: {
            HStack {
              Spacer()
              if tag == "add" {
                Image(systemName: "pencil.circle.fill")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 20)
                  .foregroundColor(.white)
              } else {
                Text(tag)
                  .foregroundColor(Color.white)
                  .font(Font.system(size: 13))
              }
              Spacer()  // fixed: button clickable area
            }
          }
          .frame(width: itemWidth, height: 30)
          .background(Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)))
          .cornerRadius(15)
          .overlay {
            if selectedTag == tag {
              HStack {
                ZStack {
                  Circle()
                    .fill(Color.white)
                  Circle()
                    .stroke(lineWidth: 1)
                    .fill(Color.black)
                }
                .frame(width: 6, height: 6)
                Spacer()
                ZStack {
                  Circle()
                    .fill(Color.white)
                  Circle()
                    .stroke(lineWidth: 1)
                    .fill(Color.black)
                }
                .frame(width: 6, height: 6)
              }
              .padding(.horizontal,6)
            } else {
              EmptyView()
            }
          }
        }
      }
      .padding(.vertical, 10)
      .padding(.horizontal, 20)
    }
  }
}

struct EditTagList_Previews: PreviewProvider {
  @State static private var selectedTag = "睡觉"
  static var previews: some View {
    let tags: [String] = [
      "睡觉", "工作", "学习", "吃饭", "活动", "休息", "其他", "在线", "add"
    ]

    let columnLayout = Array(repeating: GridItem(spacing: 6), count: 4)
    EditTagList(columnLayout: columnLayout, tags: tags, selectedTag: $selectedTag) {
      print("action")
    }
  }
}
