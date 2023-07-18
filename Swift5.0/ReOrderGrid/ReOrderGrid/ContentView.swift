//
//  ContentView.swift
//  ReOrderGrid
//
//  Created by 蔡志文 on 7/17/23.
//

import SwiftUI

struct ContentView: View {
  @State private var colors: [Color] = [
    .red, .green, .black, .blue, .brown, .cyan, .gray, .indigo, .mint, .pink, .orange, .purple, .teal
  ]
  @State private var draggingItem: Color?
    var body: some View {
      NavigationStack {
        ScrollView {
          let column = Array(repeating: GridItem(spacing: 30), count: 3)
          LazyVGrid(columns: column, alignment: .center, spacing: 10) {
            ForEach(colors, id: \.self) { color in
              GeometryReader {
                let size = $0.size
                RoundedRectangle(cornerRadius: 10)
                  .fill(color.gradient)
                  .draggable(color) {
                      RoundedRectangle(cornerRadius: 10)
                      .fill(.ultraThickMaterial)
                      .frame(width: 1, height: 1)
                      .onAppear {
                        draggingItem = color
                      }
                  }
                  .dropDestination(for: Color.self) { items, location in
                    draggingItem = nil
                    return false
                  } isTargeted: { status in
                    if let draggingItem, status, draggingItem != color {
                      if let sourceIndex = colors.firstIndex(where: { v in v == draggingItem }),
                         let destinationIndex = colors.firstIndex(where: { v in v == color }) {
                        withAnimation(.bouncy) {
                          let sourceItem = colors.remove(at: sourceIndex)
                          colors.insert(sourceItem, at: destinationIndex)
                        }
                      }
                    }
                  }

              }
              .frame(height: 100)
            }
          }
          .padding(15)
        }
        .navigationTitle("Movable Grid")
      }
    }
}

#Preview {
    ContentView()
}
