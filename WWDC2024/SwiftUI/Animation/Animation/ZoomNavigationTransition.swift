//
//  ZoomNavigationTransition.swift
//  Animation
//
//  Created by 蔡志文 on 6/18/24.
//

import SwiftUI

struct ZoomNavigationTransition: View {
  @Namespace private var animation
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: Array(repeating: .init(spacing: 10), count: 3)) {
          ForEach(sampleItems) { item in
            NavigationLink(value: item) {
              GeometryReader {
                let size = $0.size
                if let image = item.image {
                  Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
//                    .clipShape(.rect(cornerRadius: 20))
                }
              }
              .frame(height: 150)
              // 指定转场的视图
              .matchedTransitionSource(id: item.id, in: animation) { config in
                // 调整转场视图的外观
                config
                  .background(.clear)
                  .clipShape(.rect(cornerRadius: 20))
              }
            }
            .contentShape(.rect(cornerRadius: 20))
            .buttonStyle(.plain)
          }
        }
        .padding(15)
      }
      .navigationTitle("Home")
      .navigationDestination(for: Item.self) { item in
        GeometryReader {
          let size = $0.size
          if let image = item.image {
            Image(uiImage: image)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: size.width, height: size.height)
              .clipShape(.rect(cornerRadius: 20))
          }
        }
        .padding(20)
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
        // 转场动画
        .navigationTransition(.zoom(sourceID: item.id, in: animation))
      }
    }
  }
}

#Preview {
    ZoomNavigationTransition()
}

struct Item: Identifiable, Hashable {
  var id: String = UUID().uuidString
  var title: String
  var image: UIImage?
}

var sampleItems: [Item] = [
  .init(title: "Dina Adel", image: .init(named: "pexels1")),
  .init(title: "Fanny Hagan", image: .init(named: "pexels2")),
  .init(title: "Necrovive", image: .init(named: "pexels3")),
  .init(title: "Pixabay", image: .init(named: "pexels4")),
  .init(title: "Necrovive", image: .init(named: "pexels3")),
  .init(title: "Fanny Hagan", image: .init(named: "pexels2")),
]
