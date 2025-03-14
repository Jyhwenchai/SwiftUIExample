//
//  ContextMenuSample.swift
//  MenuAndCommandSample
//
//  Created by 蔡志文 on 1/17/25.
//

import SwiftUI

struct ContextMenuSample: View {
  var body: some View {
    Form {
      Text("Turtle Rock")
        .padding()
        .contextMenu {
          Button {} label: {
            Label("Add to Favorites", systemImage: "heart")
          }
          Button {} label: {
            Label("Show in Maps", systemImage: "mappin")
          }
        }

      Text("Turtle Rock")
        .padding()
        .contextMenu {
          Button {
            // Add this item to a list of favorites.
          } label: {
            Label("Add to Favorites", systemImage: "heart")
          }
          Button {
            // Open Maps and center it on this item.
          } label: {
            Label("Show in Maps", systemImage: "mappin")
          }
        } preview: {
          Image("turtlerock") // Loads the image from an asset catalog.
        }
    }

    ContextMenuItemExample(items: [.init(name: "Cell 1"), .init(name: "Cell 2"), .init(name: "Cell 3")])
//    ContextMenuItemExample(items: [])
  }
}

#Preview {
  ContextMenuSample()
}

private struct Item: Identifiable {
  var id = UUID()
  let name: String
}

private struct ContextMenuItemExample: View {
  var items: [Item]
  @State private var selection = Set<Item.ID>()

  var body: some View {
    List(selection: $selection) {
      ForEach(items) { item in
        Text(item.name)
          .frame(minHeight: 44)
      }
    }
    .contextMenu(forSelectionType: Item.ID.self) { items in
      if items.isEmpty { // Empty area menu.
        Button("New Item") {}

      } else if items.count == 1 { // Single item menu.
        Button("Copy") {}
        Button("Delete", role: .destructive) {}

      } else { // Multi-item menu.
        Button("Copy") {}
        Button("New Folder With Selection") {}
        Button("Delete Selected", role: .destructive) {}
      }
    }
  }
}
