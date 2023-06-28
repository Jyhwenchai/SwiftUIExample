//
//  ListSwipeActions.swift
//  List
//
//  Created by 蔡志文 on 6/14/23.
//

import SwiftUI

struct ListSwipeActions: View {

  struct Message: Identifiable {
    let id = UUID()
    let text: String
  }

  @State var messages: [Message] = (0..<20).map { Message(text: "message:\($0)") }

  var body: some View {
    List {
      ForEach(messages) { message in
        Text(message.text)
          .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(action: {
              withAnimation(.linear) {
                messages.removeAll(where: { $0.id == message.id })
              }
            }, label: {
              Label("Delete", systemImage: "trash")
            })
          }
      }
    }
    .navigationTitle("SwipeActions")
  }
}

#Preview {
  NavigationStack {
    ListSwipeActions()
  }
}
