//
//  SU_15_SwipeActions.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/25.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

fileprivate struct Message: Identifiable {
    var id = UUID()
    var isUnread: Bool = false
    var isFlag: Bool = false
    var content: String
}

fileprivate class MessageStore: ObservableObject {
    @Published var messages: [Message] = [
        Message(content: "Hello, World"),
        Message(content: "Hello, Swift"),
        Message(content: "Hello, SwiftUI"),
        Message(content: "Hello, SwiftUI 2"),
        Message(content: "Hello, SwiftUI 3"),
    ]
    
    func toggleUnread(_ message: Message) {
        var newMessage: Message = message
        var selectedIndex: Int = -1
        for (index, item) in messages.enumerated() {
            if item.id == message.id {
               newMessage = item
               selectedIndex = index
            }
        }
        guard selectedIndex >= 0 else { return }
        newMessage.isUnread.toggle()
        messages.remove(at: selectedIndex)
        messages.insert(newMessage, at: selectedIndex)
    }
    
    func delete(_ message: Message) {
        messages.removeAll { $0.id == message.id }
    }
    
    func flag(_ message: Message) {
        var newMessage: Message = message
        var selectedIndex: Int = -1
        for (index, item) in messages.enumerated() {
            if item.id == message.id {
               newMessage = item
               selectedIndex = index
            }
        }
        guard selectedIndex >= 0 else { return }
        newMessage.isFlag.toggle()
        messages.remove(at: selectedIndex)
        messages.insert(newMessage, at: selectedIndex)

    }
}

// `swipeActions(edge:allowsFullSwipe:content:)` 可以自定义 swipe action 添加到列表的 cell 中
@available(iOS 15.0.0, *)
struct SU_15_SwipeActions: View {
    
    @StateObject private var store = MessageStore()
    
    var body: some View {
        List {
            ForEach(store.messages) { message in
                HStack {
                    if message.isFlag {
                        Image(systemName: "flag").foregroundColor(.orange)
                    }
                    Text(message.content)
                }
                    .swipeActions(edge: .leading) {
                        Button { store.toggleUnread(message) } label: {
                            if message.isUnread {
                                Label("Read", systemImage: "envelope.open")
                            } else {
                                Label("Unread", systemImage: "envelope.badge")
                            }
                        }
                        .tint(Color.blue)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            store.delete(message)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        
                        Button {
                            store.flag(message)
                        } label: {
                            Label("Flag", systemImage: "flag")
                        }
                        .tint(.orange)
                    }
            }
        }
    }
}


@available(iOS 15.0.0, *)
struct SU_15_SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_SwipeActions()
    }
}
