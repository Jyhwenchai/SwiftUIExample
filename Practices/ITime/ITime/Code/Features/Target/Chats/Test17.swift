//
//  Test17.swift
//  ITime
//
//  Created by 蔡志文 on 6/6/23.
//

import SwiftUI

struct Test17: View {
    var body: some View {
      NavigationStack {
        List {
          ForEach(0..<10, id: \.self) { index in
            Text("index:\(index)")
          }

          Rectangle()
            .fill(Color.purple)
            .frame(width: 100, height: 30)
            .overlay {
              Menu {
                Button(action: {}) {
                  Label("Add to Reading List", systemImage: "eyeglasses")
                }
                Button(action: {}) {
                  Label("Add Bookmarks for All Tabs", systemImage: "book")
                }
                Button(action: {}) {
                  Label("Show All Bookmarks", systemImage: "books.vertical")
                }
              } label: {
                Label("", systemImage: "")
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              } primaryAction: {
                print("action")
              }
              .menuStyle(RedBorderMenuStyle())
            }
        }
        .navigationTitle("Menu")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Menu {
              Button(action: {}) {
                Label("Add to Reading List", systemImage: "eyeglasses")
              }
              Button(action: {}) {
                Label("Add Bookmarks for All Tabs", systemImage: "book")
              }
              Button(action: {}) {
                Label("Show All Bookmarks", systemImage: "books.vertical")
              }
            } label: {
              Label("Add Bookmark", systemImage: "book")
            } primaryAction: {
              //              addBookmark()
              print("action")
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Menu("Actions") {
              Button("Duplicate", action: {})
              Button("Rename", action: {})
              Button("Delete…", action: {})
                .menuActionDismissBehavior(.disabled)
              Menu("Copy") {
                Button("Copy", action: {})
                Button("Copy Formatted", action: {})
                Button("Copy Library Path", action: {})
              }
            }
          }
        }
      }
    }
}

#Preview {
    Test17()
}
struct RedBorderMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
      Menu(configuration)
        .border(Color.red)
    }
}

struct CustomLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    Label(configuration)
      .overlay {
        Text("hellodfdfdfd")
      }
  }
}
