//
//  ListEdit.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

/// `deleteDisabled` 可以禁止指定的 Cell 进行删除
/// `moveDisabled` 可以禁止指定的 Cell 进行移动
struct ListEdit: View {
  struct Message: Identifiable {
    let id = UUID()
    let text: String
  }

  @State var messages: [Message] = (0..<20).map { Message(text: "message:\($0)") }

  var body: some View {
    List {
      ForEach(messages) { message in
        Text(message.text)
          .deleteDisabled(message.text == "message:2")
          .moveDisabled(message.text == "message:3")
      }
      .onDelete { indexSet in
        messages.remove(atOffsets: indexSet)
      }
      .onMove(perform: { indices, newOffset in
        messages.move(fromOffsets: indices, toOffset: newOffset)
      })
    }
    .navigationTitle("ListEdit")
    .toolbar(content: {
      EditButton()
    })
  }
}

#Preview {
  NavigationStack {
    ListEdit()
  }
}
