//
//  ContentView.swift
//  MenuAndCommandSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form {
      Menu("Actions") {
        Button("Duplicate", action: duplicate)
        Button("Rename", action: rename)
        Button("Delete…", action: delete)
        Menu("Copy") {
          Button("Copy", action: copy)
          Button("Copy Formatted", action: copyFormatted)
          Button("Copy Library Path", action: copyPath)
        }
      }

      Menu {
        Button("Open in Preview", action: openInPreview)
        Button("Save as PDF", action: saveAsPDF)
      } label: {
        Label("PDF", systemImage: "doc.fill")
      }
      Menu {
        Button(action: addCurrentTabToReadingList) {
          Label("Add to Reading List", systemImage: "eyeglasses")
        }
        Button(action: bookmarkAll) {
          Label("Add Bookmarks for All Tabs", systemImage: "book")
        }
        Button(action: show) {
          Label("Show All Bookmarks", systemImage: "books.vertical")
        }
      } label: {
        Label("Add Bookmark", systemImage: "book")
      } primaryAction: {
        addBookmark()
      }

      Menu("Editing") {
          Button("Set In Point", action: setInPoint)
          Button("Set Out Point", action: setOutPoint)
      }
      .menuStyle(.borderlessButton)
    }
  }

  func duplicate() {}
  func rename() {}
  func delete() {}
  func copy() {}
  func copyFormatted() {}
  func copyPath() {}
  func openInPreview() {}
  func saveAsPDF() {}
  func addCurrentTabToReadingList() {}
  func bookmarkAll() {}
  func show() {}
  func addBookmark() {}
  func setInPoint() {}
  func setOutPoint() {}
}

#Preview {
  ContentView()
}
